arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

a = arr.map do |sub_array|
  sub_array.select do |element|
    element % 3 == 0
  end
end

p a

b = arr.map do |sub_array|
  sub_array.reject do |element|
    element % 3 != 0
  end
end

p b