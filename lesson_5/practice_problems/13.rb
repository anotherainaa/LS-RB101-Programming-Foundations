# Given the following data structure, return a new array containing the 
# same sub-arrays as the original but ordered logically by only 
# taking into consideration the odd numbers they contain.

# => [[1, 8, 3], [1, 6, 7], [1, 4, 9]]

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

a = arr.sort do |a, b|
  [a.first, a.last] <=> [b.first , b.last]
end

p a
# I wrote this solution, however this is not a fullproof method as it would not 
# work if the odd number is placed elsewhere in the array 

# It did help me understood more deeply how the provided solution works though

# LS Solution

b = arr.sort_by do |sub_array|
  sub_array.select do |element|
    element.odd?
  end
end

p b