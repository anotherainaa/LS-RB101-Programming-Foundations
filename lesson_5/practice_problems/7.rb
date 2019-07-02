a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

p a
p b
p arr
# Given this code, what would be the final values of a and b? 
# Try to work this out without running the code.

# My answer 

# a = 4
# b = [1, 8]
# arr = [4, [1, 8]]

# Actual answer 

# a = 2
# b = [3, 8]
# arr = [4, [3, 8]]