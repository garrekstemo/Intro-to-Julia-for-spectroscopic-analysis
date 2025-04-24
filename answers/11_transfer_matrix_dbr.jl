using TransferMatrix
using RefractiveIndex
using GLMakie

n_sio2 = RefractiveMaterial("main", "SiO2", "Franta")
n_tio2 = RefractiveMaterial("main", "TiO2", "Siefke")
n_ta2o5 = RefractiveMaterial("main", "Ta2O5", "Franta")

λ_0 = 0.63
λs = range(0.4, 1.2, length = 500)
νs = 10^4 ./ λs
n_sio2(λ_0)
n_tio2(λ_0)
n_ta2o5(λ_0)
t_sio2 = λ_0 / (4 * n_sio2(λ_0))
t_tio2 = λ_0 / (4 * n_tio2(λ_0))
t_ta2o5 = λ_0 / (4 * n_ta2o5(λ_0))

n_sio2 = n_sio2(λ_0)
n_tio2 = n_tio2(λ_0)
t_air = 2λ_0 / 2
t_sio2 = λ_0 / (4 * n_sio2)
t_tio2 = λ_0 / (4 * n_tio2)

air = Layer(λs, ones(length(λs)), zeros(length(λs)), t_air)
# sio2 = Layer(n_sio2, t_sio2)
# tio2 = Layer(n_tio2, t_tio2)
sio2 = Layer(λs, fill(n_sio2, length(λs)), zeros(length(λs)), t_sio2)
tio2 = Layer(λs, fill(n_tio2, length(λs)), zeros(length(λs)), t_tio2)
ta2o5 = Layer(n_ta2o5, t_ta2o5)

npairs = 4
unit = [tio2, sio2]
mirror1 = [air, repeat(unit, npairs)..., air]
Rp1 = Float64[]
for λ in λs
    Tp_, Ts_, Rp_, Rs_ = calculate_tr(λ, mirror1)
    push!(Rp1, Rp_)
end

npairs = 10
unit = [tio2, ta2o5]
mirror2 = [air, repeat(unit, npairs)..., air]
Rp2 = Float64[]
for λ in λs
    Tp_, Ts_, Rp_, Rs_ = calculate_tr(λ, mirror2)
    push!(Rp2, Rp_)
end

npairs = 4
unit = [tio2, sio2]
cavity = [air, repeat(unit, npairs)..., air, reverse(repeat(unit, npairs))..., air]
Rp_cav = Float64[]
for λ in λs
    Tp_, Ts_, Rp_, Rs_ = calculate_tr(λ, cavity)
    push!(Rp_cav, Rp_)
end

# λ_f = 10^4 / 13357
λ_f = 0.63
# λ_f = 10^4 / 18919
field = electric_field(λ_f, cavity)
abs2.(field.p[1, :])
field.z


f = Figure(size = (700, 1200))
DataInspector()

ax1 = Axis(f[1, 1],
    title = "Mirror reflectance",
    xlabel = "Wavenumber (cm⁻¹)",
    ylabel = "Reflectance",
    xticks = LinearTicks(5)
    )
# lines!(ax1, νs, Rpp1, label = "TiO2/Ta2O5")
# lines!(ax1, νs, Rpp2, label = "TiO2/SiO2")
lines!(ax1, λs, Rp1, label = "TiO2/SiO2")
lines!(ax1, λs, Rp2, label = "TiO2/Ta2O5")

ax2 = Axis(f[2, 1],
    title = "Reflectance of TiO2/SiO2 cavity",
    xlabel = "Wavenumber (cm⁻¹)",
    ylabel = "Reflectance",
    xticks = LinearTicks(5)
    )
lines!(ax2, νs, Rp_cav)

ax3 = Axis(f[3, 1],
    title = "Electric field",
    xlabel = "Wavenumber (cm⁻¹)",
    ylabel = "Electric field",
    xticks = LinearTicks(5)
    )
lines!(field.z, real.(field.p[1, :]))

axislegend(ax1)
f