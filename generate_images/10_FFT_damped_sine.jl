using FFTW
using GLMakie

interferrogram(t, f, τ) = sin(2π * f * t) * exp(-t / τ)

f = 1.0
τ = 2.0
fs = 1000

t = 0:1/fs:20
y = interferrogram.(t, f, τ)

X = fftshift(fftfreq(length(t), fs))
Y = fftshift(abs.(fft(y)))


fig = Figure(size = (1000, 500))
ax1 = Axis(fig[1, 1],
    ylabel = "Amplitude",
    xlabel = "Time (s)",
)
lines!(t, y)

ax2 = Axis(fig[1, 2],
    ylabel = "Amplitude",
    xlabel = "Frequency (Hz)",
)
lines!(X, Y)
xlims!(-3, 3)
fig
