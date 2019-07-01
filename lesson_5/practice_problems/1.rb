arr = ['10', '11', '9', '7', '8']

# arr.sort_by do |element|
#   element.to_i
# end

arr.sort do |a, b|
  b.to_i <=> a.to_i
end

p arr