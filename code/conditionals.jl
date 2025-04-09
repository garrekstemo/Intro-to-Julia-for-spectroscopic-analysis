using Test

x = 0

function check_number(x)
    if x > 0
        println("x is positive")
    elseif x < 0
        println("x is negative")
    else
        println("x is zero")
    end
end
check_number(x)  # x is zero

for i in 1:10
    println(i)
end

function print_numbers(n)
    for i in 1:n
        if i % 2 == 0
            println("$i is even")
        else
            println("$i is odd")
        end
    end
end

print_numbers(10)

function abs(x)
    if x < 0
        return -x
    else
        return x
    end
end

abs(-5)

# Activity

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