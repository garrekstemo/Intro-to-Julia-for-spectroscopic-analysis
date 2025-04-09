using GLMakie

"""
    damped_sine_wave(x, A, f, τ)
Generate a damped sine wave.
# Arguments
- `x`: The x values.
- `A`: The amplitude.
- `f`: The frequency in Hz.
- `τ`: The decay time constant in seconds.
"""
function decaying_damped_sine(x, A, f, τ)
    A * exp(-x / τ) * sin(2π * f * x )
end

x = 1:0.1:10
y = decaying_damped_sine.(x, 1, 0.1, 0.5)


fig = Figure()
ax = Axis(fig[1, 1], title = "Decaying Damped Sine Wave", xlabel = "x", ylabel = "y")
lines!(x, y)
fig


# save("output/damped_sine_wave.png", fig)