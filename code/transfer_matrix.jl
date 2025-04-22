using TransferMatrix
using RefractiveIndex
using GLMakie

n_air = RefractiveMaterial("other", "air", "Ciddor")
n_gaas = RefractiveMaterial("main", "GaAs", "Perner")
n_znse = RefractiveMaterial("main", "ZnSe", "Amotchkina")[1]
n_sio2 = RefractiveMaterial("main", "SiO2", "Kischkat")
n_ge = RefractiveMaterial("main", "Ge", "Amotchkina")

λ_0 = 3.0
λs = range(1.6, 5.5, length = 100)
n_ge(λ_0)
n_znse(λ_0)
n_sio2(λ_0)
n_gaas(λ_0)

t_ge = λ_0 / (4 * n_ge(λ_0))
t_znse = λ_0 / (4 * n_znse(λ_0))
t_sio2 = λ_0 / (4 * n_sio2(λ_0))
t_gaas = λ_0 / (4 * n_gaas(λ_0))

air = Layer(n_air, 0.1)
ge = Layer(n_ge, t_ge)
znse = Layer(n_znse, t_znse)
sio2 = Layer(n_sio2, t_sio2)
gaas = Layer(n_gaas, t_gaas)

nperiods1 = 3
unit1 = [ge, sio2]
mirror1 = [air, repeat(unit1, nperiods1)..., air]

nperiods2 = 3
unit2 = [ge, znse]
mirror2 = [air, repeat(unit2, nperiods2)..., air]

Rpp1 = Float64[]
for λ in λs
    Tpp_, Tss_, Rpp_, Rss_ = calculate_tr(λ, mirror1)
    push!(Rpp1, Rpp_)
end

Rpp2 = Float64[]
for λ in λs
    Tpp_, Tss_, Rpp_, Rss_ = calculate_tr(λ, mirror2)
    push!(Rpp2, Rpp_)
end

f = Figure()
ax1 = Axis(f[1, 1],
    title = "Reflectance of GaAs/Ge mirror",
    xlabel = "Wavelength (μm)",
    ylabel = "Reflectance",
    xticks = LinearTicks(5)
    )
lines!(ax1, λs, Rpp1)
lines!(ax1, λs, Rpp2)
f