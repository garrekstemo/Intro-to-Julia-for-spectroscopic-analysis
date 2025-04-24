using FFTW
using GLMakie

function f(t, n, ω)
    (1 / n) * sin(n * ω * t)
end

fs = 100000

t = 0:1/fs:2
ω = 2π * 3
y = sum([f.(t, n, ω) for n in 1:2:10])
length(1:2:10)

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
    xticks = LinearTicks(5),
)
lines!(X, Y)
xlims!(0, 100)
fig