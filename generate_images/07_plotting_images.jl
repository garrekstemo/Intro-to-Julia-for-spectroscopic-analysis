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
    xlabel = "Time (s)",
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

# Cascading layout

function damped_sine(x, A, f, τ)
    A * exp(-x / τ) * sin(2π * f * x )
end

ps = 0:0.1:5
ps_hires = 0:0.01:5  # higher resolution for the line plot

f = Figure()
ax = Axis(f[1, 1],
    title = "Time traces",
    xlabel = "Time (ps)",
    ylabel = "Intensity",
)

num_data_sets = 3
offset = 5
noise_level = 0.5
for i in 1:num_data_sets
    A, ω, τ = rand(1:3, 3)
    intensity = damped_sine.(ps_hires, A, ω, τ)
    intensity_noisy = damped_sine.(ps, A, ω, τ) + noise_level * randn(length(ps))

    scatter!(ps, intensity_noisy .+ i * offset)
    lines!(ps_hires, intensity .+ i * offset, color = :black, linestyle = :dash)
end

f

##