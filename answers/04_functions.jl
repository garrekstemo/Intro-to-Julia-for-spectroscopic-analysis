using Test

function is_even(x)
    x % 2 == 0
end

@test is_even(2) == true
@test is_even(3) == false
@test is_even(0) == true

join_with_space(a, b) = "$a $b"

@test join_with_space("good", "morning") == "good morning"
@test join_with_space("Julia", "rocks") == "Julia rocks"


function wavelength_to_ev(λ)
    h = 4.135e-15 # eV·s
    c = 3e8 # m/s
    # λ *= 1e-9

    # h * c / λ
    1240 / λ
end

@test wavelength_to_ev(620) ≈ 2.0 atol=1e-2
@test wavelength_to_ev(310) ≈ 4.0 atol=1e-2
@test wavelength_to_ev(1240) ≈ 1.0 atol=1e-2


function nth_odd(x)
    2 * x - 1
end

@test nth_odd(1) == 1
@test nth_odd(5) == 9
@test nth_odd(19) == 37