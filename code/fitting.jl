using GLMakie
using LsqFit


function lorentz(x, p)
    A, Γ, x0 = p
    h = @. (x - x0) / (Γ/2)
    @. A / (1 + h^2)
end


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
f = Figure()
DataInspector()

ax = Axis(f[1, 1],
    title = "Lorentzian Line Shape",
    xlabel = "Wavelength (nm)",
    ylabel = "Absorbance",
    xticks = LinearTicks(5)
    )

scatter!(
    ax,
    xdata,
    ydata,
    color = :tomato,
    label = "data"
)
lines!(
    ax,
    xdata,
    lorentz(xdata, fit.param),
    color = :indigo,
    label = "fit"
)
hlines!(0.5, linestyle = :dash, color = :gray)

text!("FWHM = ($(Γ) ± $(err_Γ)) nm", position = (400, 0.7))
axislegend(ax)
f

# save("images/lorentzian_fit.png", f)