using GLMakie
using LsqFit

linear_model(x, p) = p[1] * x .+ p[2]

function lorentz(x, p)
    A, Γ, x0 = p
    h = @. (x - x0) / (Γ/2)
    @. A / (1 + h^2)
end

p = [0.5, 1]
x = -9:2:9
y = linear_model.(x, Ref(p)) .+ 1.5 .* randn.()

p0 = [1.3, 0.2]
fit = curve_fit(linear_model, x, y, p0)
sigma = stderror(fit)  # access the standard error of the fit


f = Figure()
ax = Axis(f[1, 1])
xlims!(ax, -10, 10)
ylims!(ax, -10, 10)

axislimits = ax.limits[]
axrange = axislimits[2][2] - axislimits[2][1]

for (xi, yi) in zip(x, y)
    yfit = linear_model(xi, fit.param)

    if yi > yfit
        ymin = (yfit - axislimits[2][1]) / axrange
        ymax = (yi - axislimits[2][1]) / axrange
        println("yi > yfit: ", round(ymin, digits=2), " > ", round(ymax, digits=2))
    else
        ymin = (yi - axislimits[2][1]) / axrange
        ymax = (yfit - axislimits[2][1]) / axrange
        # println("yi > yfit", yi, " > ", yfit)
    end

    vlines!(xi, ymin=ymin, ymax=ymax, color = :gray)
end
scatter!(x, y, color = :deepskyblue3, label = "data")
lines!(
    -10:10,
    linear_model.(-10:10, Ref(p0)),
    linestyle = :dash,
    color = :gray30,
    label = "initial guess"
    )
lines!(
    -10:10,
    linear_model.(-10:10, Ref(fit.param)),
    color = :tomato,
    label = "fit"
)

f

# save("images/linear_fit.png", f)

##

# Generate fake data and add noise to y.
A = 1
Γ = 28
x0 = 510

xdata = 400:1:650
ydata = lorentz(xdata, [A, Γ, x0]) + 0.08 * randn(length(xdata))

# Perform the fit using the LsqFit package
p0 = [0.5, 10, 500]  # initial guess for parameters
fit = curve_fit(lorentz, xdata, ydata, p0)
params = fit.param  # access the fit results
sigma = stderror(fit)  # access the standard error of the fit


A = round(params[1], digits = 2)
Γ = round(params[2], digits = 1)
err_Γ = round(sigma[2], digits = 1)
x0 = round(params[3], digits = 2)

# Make the figure
f = Figure(size = (600, 600))
DataInspector()

ax1 = Axis(f[1, 1],
    title = "Residuals",
    xlabel = "Wavelength (nm)",
    xticks = LinearTicks(5),
    height = 100,
    )
scatter!(
    xdata,
    ydata .- lorentz(xdata, fit.param),
    label = "residuals"
)

ax2 = Axis(f[2, 1],
    title = "Lorentzian Line Shape",
    xlabel = "Wavelength (nm)",
    ylabel = "Absorbance",
    xticks = LinearTicks(5)
    )

scatter!(
    xdata,
    ydata,
    color = :tomato,
    label = "data"
)
lines!(
    xdata,
    lorentz(xdata, fit.param),
    color = :indigo,
    linewidth = 3,
    label = "fit"
)
hlines!(0.5, linestyle = :dash, color = :gray)

text!("FWHM = ($(Γ) ± $(err_Γ)) nm", position = (400, 0.7))

hidexdecorations!(ax1, grid=false)
axislegend(ax2)
f

# save("images/lorentzian_fit_residuals.png", f)