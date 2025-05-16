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

##

# Problem 1
# Solution 1
for i in 1:10
    if (i % 2 == 0) && !(i % 4 ==0)  # students fill in this line
        println(i)
    end
end

# Solution 2
for i in 1:10
    if i % 2 == 0 && i % 4 != 0  # students fill in this line
        println(i)
    end
end

##

# Problem 2: check if x is between 10 and 20, inclusive
# Solution: use AND instead of OR. Change > and < to >= and <=, respectively.

x = 10
# if x > 10 || x < 20  -> incorrect code
if x >= 10 && x <= 20  # corrected code
    println("x is between 10 and 20")
else
    println("x is not between 10 and 20")
end
