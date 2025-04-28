using FFTW
using GLMakie

signal(t, f1, f2) = sin(2π * f1 * t) + 0.5 * sin(2π * f2 * t)

fs = 1000  # sample rate (samples per second)
t_max = 1
t = 0:1/fs:t_max  # time coordinate in seconds

# Sum of a sine wave and its harmonic at half amplitude.

f1 = 60
f2 = 120
y = signal.(t, f1, f2)


# The first half of the returned array is the positive frequencies,
# the second half is the negative frequencies.

Y = fftshift(fft(y))
X = fftshift(fftfreq(length(t), fs))


fig = Figure(size = (700, 500))
DataInspector()
ax1 = Axis(fig[1, 1],
    title = "Signal",
    ylabel = "Intensity",
    xlabel = "Time (s)",
)
lines!(t, y, color = :deepskyblue4)
xlims!(0, 4 / f_1)

ax2 = Axis(fig[2, 1],
    title = "Spectrum",
    ylabel = "Intensity",
    xlabel = "Frequency (Hz)",
    xticks = LinearTicks(7),
)
lines!(X, abs.(Y), color = :firebrick4)
xlims!(0, 200)

fig


# save("images/FFT_two_notes.png", fig)