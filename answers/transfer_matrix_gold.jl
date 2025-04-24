using TransferMatrix
using RefractiveIndex
using GLMakie

n_au = RefractiveMaterial("main", "Au", "Ciesielski")

λ_0 = 3.0
λs = range(1.5, 8.1, length = 1000)
νs = 10^4 ./ λs
t_air = λ_0 / 2
10^4 / 3
air = Layer(λs, ones(length(λs)), zeros(length(λs)), t_air)
au = Layer(n_au, 0.005)

cavity = [air, au, air, au, air]
Tp = Float64[]
for λ in λs
    Tp_, Ts_, Rp_, Rs_ = calculate_tr(λ, cavity)
    push!(Tp, Tp_)
end

# λ_f = 10^4 / 1611
λ_f = 3.4
field = electric_field(λ_f, cavity)
abs2.(field.p[1, :])
field.z

f = Figure(size = (700, 1200))
DataInspector()

ax1 = Axis(f[1, 1],
    title = "Transmittance of Au cavity",
    xlabel = "Wavenumber (cm⁻¹)",
    ylabel = "Reflectance",
    xticks = LinearTicks(5)
    )
# lines!(ax1, νs, Tp)
lines!(ax1, λs, Tp)

ax2 = Axis(f[2, 1],
    title = "Electric field",
    xlabel = "Wavenumber (cm⁻¹)",
    ylabel = "Electric field",
    xticks = LinearTicks(5)
    )
lines!(field.z, real.(field.p[1, :]))


f