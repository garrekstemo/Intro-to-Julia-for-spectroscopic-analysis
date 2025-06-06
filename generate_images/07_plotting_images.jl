using GLMakie

f = Figure()
ax1 = Axis(f[1, 1], title = "First Axis")
f
save("images/one_axis.png", f)

##

f = Figure()
ax1 = Axis(f[1, 1], title = "First Axis")
ax2 = Axis(f[1, 2], title = "Second Axis")
f
save("images/two_axes.png", f)

##
f = Figure()
ax1 = Axis(f[1, 1], title = "First Axis")
ax2 = Axis(f[1, 2], title = "Second Axis")
ax3 = Axis(f[2, 1:2], title = "Third Axis")
f
save("images/three_axes.png", f)

##
function damped_sine(x, A, f, τ)
    A * exp(-x / τ) * sin(2π * f * x )
end

seconds = 0:0.1:5
intensity = damped_sine.(seconds, 3, 1, 1)
intensity_noisy = intensity + 0.2 * randn(length(seconds))  # add noise


f = Figure()
ax = Axis(f[1, 1],
    title = "Damped decaying sine wave",
    xlabel = "Time (ps)",
    ylabel = "Intensity",
)
scatter!(
    seconds,
    intensity_noisy,
    color = :firebrick3,
    label = "Noisy data",
    )
lines!(
    seconds,
    intensity,
    color = :deepskyblue4,
    linestyle = :dash,
    label = "f(t) = A exp(−t / τ) sin(2π f t)",
    )

axislegend(position = :rb)
f

# save("images/damped_sine_wave.png", f)

##

# Cascading layout (simple)

function damped_sine(x, A, f, τ)
    A * exp(-x / τ) * sin(2π * f * x )
end

f = Figure()
ax = Axis(f[1, 1],
    title = "Time traces",
    xlabel = "Time (ps)",
    ylabel = "Intensity",
)

ps = 0:0.02:5

num_data_sets = 3
offset = 5
noise_level = 0.1

for i in 1:num_data_sets
    A, ω, τ = rand(1:3, 3)
    intensity = damped_sine.(ps, A, ω, τ) .+ noise_level * randn(length(ps))
    lines!(ps, intensity .+ (i - 1) * offset, label = "Data set $i")
end

axislegend(ax)
f

# save("images/cascading_layout.png", f)

##

# Fonts and styling

function damped_sine(x, A, f, τ)
    A * exp(-x / τ) * sin(2π * f * x )
end

noise_level = 0.1
ps = 0:0.02:5
A, ω, τ = 1, 1, 1
intensity = damped_sine.(ps, A, ω, τ) .+ noise_level * randn(length(ps))

f = Figure(fontsize = 20)
ax = Axis(f[1, 1],
    title = "Styled plot",
    xlabel = "Time (ps)",
    ylabel = "Intensity",
)
lines!(ps, intensity)

f