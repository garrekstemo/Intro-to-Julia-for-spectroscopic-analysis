using GLMakie

function loss(model, xdata, ydata, p)
    sum(((x, y),) -> abs2(y - model(x, p)), zip(xdata, ydata))
end
function squared_surface(model, xdata, ydata, p1, p2)
    return [loss(model, xdata, ydata, [p1[i], p2[j]]) for i in eachindex(p1), j in eachindex(p2)]
end

function squared_surface_3param(model, xdata, ydata, p2_vals, p3_vals; p1_fixed=0.0)
    return [loss(model, xdata, ydata, [p1_fixed, p2_vals[i], p3_vals[j]])
            for i in eachindex(p2_vals), j in eachindex(p3_vals)]
end

double_exp(x, p) = exp(-x / p[1]) + exp(-x / p[2])
linear_model(x, p) = p[1] * x + p[2]
sine_model(x, p) = p[1] * sin.(p[2] * x .+ p[3])

# Linear model
p_lin = [1, 2]
x_lin = range(-5, 5, length = 10)
y_lin = linear_model.(x_lin, Ref(p_lin)) .+ 0.02 .* randn.()
p1_lin = range(-5, 5, length = 100)
p2_lin = range(-5, 5, length = 100)
surf_lin = log10.(squared_surface(linear_model, x_lin, y_lin, p1_lin, p2_lin))

# Double exponential model
p_de = [11, 3]
x_de = range(0, 40, length = 100)
y_de = double_exp.(x_de, Ref(p_de)) .+ 0.02 .* randn.()
p1_de = range(1, 15, length = 100)
p2_de = range(1, 15, length = 100)
surf_de = log10.(squared_surface(double_exp, x_de, y_de, p1_de, p2_de))


f = Figure(size = (900, 900))
DataInspector()

ax1a = Axis(f[1, 1],
    title = "Linear Model\nf(x) = $(p_lin[1])x + $(p_lin[2])",
)
scatter!(ax1a, x_lin, y_lin)

ax1b = Axis(f[1, 2],
    title = "Linear Loss Surface",
    xlabel = "p1",
    ylabel = "p2",
    )
heatmap!(p1_lin, p2_lin, surf_lin')
Colorbar(f[1, 3], label = "log10(Loss)")

ax2a = Axis(f[2, 1],
    title = "Double Exponential Model\nf(x) = exp(-x / $(p_de[1])) + exp(-x / $(p_de[2]))",
)
lines!(ax2a, x_de, y_de)

ax2b = Axis(f[2, 2],
    title = "Double Exponential Loss Surface",
    xlabel = "p1",
    ylabel = "p2",
    )
heatmap!(p1_de, p2_de, surf_de')
Colorbar(f[2, 3], label = "log10(Loss)")

f

# save("images/loss_surface.png", f)