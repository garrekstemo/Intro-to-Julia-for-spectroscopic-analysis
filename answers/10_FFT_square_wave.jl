using FFTW
using GLMakie

interferrogram(t, n, ω) = (1 / n) * sin(n * ω * t)

N = 2^10  # number of samples
Ts = 1 / (1.1 * N)  # sampling period
fs = 1 / Ts  # sampling rate
fn = fs / 2  # Nyquist frequency
D = N / fs  # duration of the signal in seconds
df = fs / N  # frequency resolution in Hz
t = 0:Ts:(D - Ts)
ω = 2π * 20
harmonics = 1:2:5  # number of harmonics
y = (4 / π) * sum([interferrogram.(t, n, ω) for n in harmonics])

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
# xlims!(0, 2)

ax2 = Axis(fig[2, 1],
    title = "Spectrum",
    ylabel = "Intensity",
    xlabel = "Frequency (Hz)",
    xticks = LinearTicks(5),
)
lines!(X, Y)
xlims!(0, 500)
fig