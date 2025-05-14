# Exercise: seconds in 3 years
s_per_min = 60
m_per_hour = 60
h_per_day = 24
day_per_year = 365
years = 3
years * day_per_year * h_per_day * m_per_hour * s_per_min


# Problem: Write a short program that prints only the even numbers
# between 1 and 10 that are not divisible by 4.

# Learn about the % operator and use it in the following code:

for i in 1:10
    if i % 2 == 0 && i % 4 != 0  # students fill in this line
        println(i)
    end
end

# Problem: check if x is between 10 and 20, inclusive
# Solution: use AND instead of OR. Change > and < to >= and <=, respectively.
x = 10

# if x > 10 || x < 20  -> incorrect code
if x >= 10 && x <= 20  # corrected code
    println("x is between 10 and 20")
else
    println("x is not between 10 and 20")
end
