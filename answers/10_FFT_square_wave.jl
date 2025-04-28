using FFTW
using GLMakie

interferrogram(t, n, f) = (1 / n) * sin(2π * n * f * t)

N = 2^12 - 1  # number of points
Ts = 1 / (1.1 * N)  # sample spacing
fs = 1 / Ts  # sample rate (samples per second)

# Extra information
df = fs / N  # frequency resolution in Hz
fn = fs / 2  # Nyquist frequency

# Time coordinate
t_0 = 0
t_max = t_0 + N * Ts
t = t_0:Ts:t_max
length(t)

f = 20
harmonics = 1:2:3  # number of harmonics
y = (4 / π) * sum([interferrogram.(t, n, f) for n in harmonics])

X = fftshift(fftfreq(length(t), fs))
Y = fftshift(abs.(fft(y)))


fig = Figure(size = (800, 600))
DataInspector()
ax1 = Axis(fig[1, 1],
    title = "Interferrogram",
    ylabel = "Intensity",
    xlabel = "Time (s)",
)
lines!(t, y) 
xlims!(0, 4 / f)  # show only the first 4 periods

ax2 = Axis(fig[2, 1],
    title = "Spectrum",
    ylabel = "Intensity",
    xlabel = "Frequency (Hz)",
    xticks = LinearTicks(5),
)
lines!(X, Y)
xlims!(0, 200)
fig