using GLMakie


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

save("images/damped_sine_wave.png", f)