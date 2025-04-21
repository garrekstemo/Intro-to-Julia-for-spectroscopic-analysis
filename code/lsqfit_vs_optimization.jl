using GLMakie
using LsqFit
using Optimization
using OptimizationOptimJL

# Define the model: sum of two Gaussians
function double_gaussian(x, p)
    a1, μ1, σ1, a2, μ2, σ2 = p
    return a1 .* exp.(-(x .- μ1).^2 ./ (2σ1^2)) .+ a2 .* exp.(-(x .- μ2).^2 ./ (2σ2^2))
end

function spike_plus_plateau(x, p)
    a, b, c = p  # a: height of Gaussian, b: center, c: width
    spike = a .* exp.(-((x .- b)./c).^2)
    plateau = 1.0 ./ (1 .+ exp.(-(x .- 5.0)))  # sigmoid centered at x=5
    return spike .+ plateau
end

function loss(p, data)
    x, y = data
    yfit = spike_plus_plateau(x, p)
    return sum(abs2, (y .- yfit))
end

# Generate synthetic data
xdata = range(0, 10; length=100)
true_params = [1.0, 3.0, 0.05]  # narrow Gaussian spike at x=3
ytrue = spike_plus_plateau(xdata, true_params)
noise = 0.05 .* randn(length(xdata))
ydata = ytrue .+ noise

# Bad initial guess (intentionally off)
p0 = [0.5, 5.0, 1.0]

# Fit using Levenberg-Marquardt
fit = curve_fit(spike_plus_plateau, xdata, ydata, p0)

# Extract fitted parameters and model prediction
yfit = spike_plus_plateau(xdata, fit.param)

# Fit using Optimization
prob = OptimizationProblem(loss, p0, (xdata, ydata))
res = solve(prob, Optim.NelderMead())
yfit_opt = spike_plus_plateau(xdata, res.u)


f = Figure()
ax = Axis(f[1, 1],
    title = "Double Gaussian Fit",
    xlabel = "x",
    ylabel = "y",
    xticks = LinearTicks(5)
    )
scatter!(xdata, ydata, label="Noisy data")
lines!(xdata, ytrue, label="True function")
lines!(xdata, yfit, label="LsqFit result")
lines!(xdata, yfit_opt, label="Optimization result")

axislegend(ax, position = :lt)

f
