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


function add(x, y)
    return x + y
end

add(1, 2)  # 3

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