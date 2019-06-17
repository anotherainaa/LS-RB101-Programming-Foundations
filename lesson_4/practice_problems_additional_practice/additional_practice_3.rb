# Practice Problem 3
# throw out the really old people (age 100 or older).

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# Solution 1: each

young_people = {}

ages.each do |name, age|
  if age < 100
    young_people[name] = age
  end
end

# p young_people

# Solution 2: reject

results = ages.reject do |name, age|
  age >= 100
end

# p results

# solution 3: select

results = ages.select do |name, age|
  age
end

# p results

# LS solution : keep_if
# select! is equivalent to keep_if but select! returns nil if no changes were made
# this is a destructive method

ages.keep_if do |name, age|
  age < 100
end


