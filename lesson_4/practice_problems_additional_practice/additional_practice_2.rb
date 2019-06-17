# Practice Problem 2
# Add up all of the ages from the Munster family hash:

ages = { "Herman" => 32, 
           "Lily" => 30, 
        "Grandpa" => 5843, 
          "Eddie" => 10, 
        "Marilyn" => 22, 
           "Spot" => 237 } 

# Solution 1: each

sum_of_ages = 0

ages.each do |name, age|
  sum_of_ages += age
end

# p sum_of_ages

# Solution 2: inject

sum1 = ages.inject(0) do |sum, (key, value)|
   sum + value
end

p sum1

# LS Solution: inject

p ages.values.inject(:+)