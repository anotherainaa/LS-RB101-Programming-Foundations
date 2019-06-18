numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# In shift, the iteration would stop half way
# This would output
# 1
# 3

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# 4
# 3
# 2
# 1

# Note that my ansewer for pop above is wrong. 
# The output 1 & 2

# Both iterations stopped halfway

