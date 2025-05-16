using Test

# In-class exercises
# Exercise 1
function is_even(x)
    x % 2 == 0
end

@test is_even(2) == true
@test is_even(3) == false
@test is_even(0) == true


# Exercise 2
join_with_space(a, b) = "$a $b"

@test join_with_space("good", "morning") == "good morning"
@test join_with_space("Julia", "rocks") == "Julia rocks"

##
# Problems

# Problem 1

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

##
# Problem 2

function quadrant(x,y)
    if x > 0 && y > 0
        return 1
    elseif x < 0 && y > 0
        return 2
    elseif x < 0 && y < 0
        return 3
    elseif x > 0 && y < 0
        return 4
    else
        return "on an axis"
    end
end

@test quadrant(1.0, 2.0) == 1
@test quadrant(-13.0, -2) == 3
@test quadrant(4, -3) == 4
@test quadrant(-2, 6) == 2

##
# Problem 3

function collatz(n)
    sequence = [n]
    while n > 1
        if n % 2 == 0
            n = n ÷ 2
        else
            n = 3n + 1
        end
        push!(sequence, n)
    end
    sequence
end

@test collatz(19) == [
                19, 58, 29, 
                88, 44, 22, 
                11, 34, 17, 
                52, 26, 13, 
                40, 20, 10, 
                5, 16, 8, 
                4, 2, 1]
