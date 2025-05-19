using GLMakie

fig = Figure(size = (500, 800))
ax1 = Axis(fig[1, 1])

vlines!(0, ymin=0.0, ymax = 0.5)
text!(0.1, 1.2, text=L"f(x) = δ(x)", fontsize = 20)
xlims!(-1, 1)
ylims!(0, 2)


ax2 = Axis(fig[2, 1])
hlines!(1/2π)
vlines!(0, linewidth = 1, color = :black)
text!(0.1, 0.3, text=L"F(ω) = \frac{1}{2\pi}", fontsize = 20)
xlims!(-1, 1)
ylims!(0, 0.4)

hideydecorations!(ax1, )
hideydecorations!(ax2, )
hidexdecorations!(ax1, ticks=false, ticklabels = false)
hidexdecorations!(ax2, ticks = false, ticklabels = false)

fig
# save("images/delta_distribution.png", fig)