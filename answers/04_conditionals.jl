
# In-class demonstration
x = -1
if x > 0
    println("x is positive")
elseif x < 0
    println("x is negative")
else
    println("x is zero")
end

##

# In-class activities
# Exercise 1
x = 26
if x < 0
    println("It's freezing!")
elseif (x >= 0 && x < 10)
    println("It's cold!")
elseif (x >= 10 && x < 25)
    println("It's warm.")
elseif x >= 25
    println("It's hot!")
end


# Problems
# Two solutions (at least)

# Solution 1
total = 0
n = 10
for i in 1:n
    total += i
end
total

##
# Solution 2
n = 10
total = 0
while n > 0
    total += n
    n -= 1
end
total

##

# Activity

# Do this one later
# 2. Write a function that returns the quadrant (1, 2, 3, 4) of a point (x, y) in 2D Cartesian space.

#     *Bonus: What should the function return if the point is on an axis or the origin?*

#     ```julia
#     function quadrant(x, y)
#         # add code here
#     end

#     using Test
#     @test quadrant(1.0, 2.0) == 1
#     @test quadrant(-13.0, -2) == 3
#     @test quadrant(4, -3) == 4
#     @test quadrant(-2, 6) == 2
#     ```


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

for i in 1:10
    println(i)
end

for i in 1:n
    if i % 2 == 0
        println("$i is even")
    else
        println("$i is odd")
    end
end



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
