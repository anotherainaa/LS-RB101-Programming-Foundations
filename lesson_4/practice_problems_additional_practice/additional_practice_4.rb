# Pick out the minimum age from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# solution 1: each

min_age = nil

ages.each do |name, age|
  if ages.min.last == age
    min_age = age
  end
end

# p min_age

# I can just do this instead of all of the above
# but it's less readable compared to LS solution below

ages.min.last

# LS solution 

# p ages.values.min

# loop 

smallest_age = ages.shift.last
counter = 0
keys = ages.keys

loop do
  break if counter == ages.size

  current_key = keys[counter]
  current_value = ages[current_key]

  if current_value < smallest_age 
    smallest_age = current_value
  end

  counter +=1
end

p smallest_age