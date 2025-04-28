using FFTW
using GLMakie
using CSV
using DataFrames
using LsqFit

function damped_sine(t, p)
    A, τ, f, ϕ, C = p
    @. A * exp(-t / τ) * sin(2π * f * t + ϕ) + C
end

exponential(t, p) = @. p[1] * exp(-t / p[2]) + p[3]

# Load the data
data = CSV.read("data/Zhu_2024_fig3a.txt", DataFrame)

xdata = data[:, 1]
ydata = data[:, 2]
x = range(0, xdata[end], length = 200)
p0 = [0.7, 100, 0.2]
fit = curve_fit(exponential, xdata, ydata, p0)
fit.param
err = stderror(fit)

residuals = ydata .- exponential(xdata, fit.param)
p1 = [0.1, 500, 0.005, π, 0.0]
fit_residuals = curve_fit(damped_sine, xdata, residuals, p1)
fit_residuals.param
err = stderror(fit_residuals)

fs = (xdata[2] - xdata[1]) * 1e-15
X = fftshift(fftfreq(length(xdata), 1 / fs)) ./ 3e10
Y = fftshift(abs.(fft(residuals)))


fig = Figure(size = (1000, 500))
DataInspector()
ax1 = Axis(fig[1, 1],
    title = "Relaxation Kinetics from Zhu et al. (2024)",
    ylabel = "Amplitude",
    xlabel = "Time (fs)",
)
scatter!(
    xdata, ydata,
    marker = :circle,
    color = :transparent,
    strokecolor = :firebrick3,
    strokewidth = 1,
    label = "Data"
)
lines!(
    xdata,
    exponential(xdata, fit.param),
    color = :firebrick3,
    linewidth = 3,
    label = "Fit",
)
lines!(
    xdata, 
    residuals,
    color = :black,
    label = "Residuals",
    )
lines!(
    x,
    damped_sine(x, fit_residuals.param),
    color = :red,
)

ax2 = Axis(fig[1, 2],
    title = "Fourier Transform of Residuals",
    ylabel = "Amplitude",
    xlabel = "Frequency (cm⁻¹)",
)
lines!(X, Y)
# xlims!(-1000, 1000)

axislegend(ax1)
fig