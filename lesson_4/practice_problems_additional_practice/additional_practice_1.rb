# Practice Problem 1

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# Solution 1
hash = {}

flintstones.each_with_index do |name, index|
  hash[name] = index
end

# p hash

# Solution 2 => The caveats of this solution is that it cannot be applied
# to arrays where there are duplicate values

hash2 = flintstones.each_with_object({}) do |value, hash|
  hash[value] = flintstones.index(value)
end

# p hash2

# Solution3 => #map in combination with #with_index

nested_array = flintstones.map.with_index do |name, index|
  [name, index]
end

# p nested_array
# p nested_array.to_h

# normal loop

hash4 = {}
counter = 0

loop do
  break if counter == flintstones.size

  current_name = flintstones[counter]
  hash4[current_name] = counter

  counter +=1
end

p hash4

# ==================================

# Practice Problem 2

