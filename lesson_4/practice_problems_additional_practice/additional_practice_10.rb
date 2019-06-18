munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# munsters_keys = munsters.keys
# counter = 0

# loop do
#   break if counter == munsters_keys.size

#   current_munster = munsters_keys[counter]
#   current_munster_keys = munsters[current_munster].keys
#   current_age = munsters[current_munster][current_munster_keys[0]]

#   if current_age > 65
#     munsters[current_munster]["age_group"] = 'senior'
#   elsif current_age > 17
#     munsters[current_munster]["age_group"] = 'adult'
#   else
#     munsters[current_munster]["age_group"] = 'kid'
#   end
#   counter += 1
# end

# p munsters

# Solution 2

# munsters.each do |munster, hash|
#   current_age = hash["age"]
#   if current_age > 65
#     hash["age_group"] = 'senior'
#   elsif current_age > 17
#     hash["age_group"] = 'adult'
#   else
#     hash["age_group"] = 'kid'
#   end
# end

# p munsters

# LS Solution

munsters.each do |name, details|
  case details["age"]
  when 0...18
    details["age_group"] = "kid"
  when 18...65
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end

p munsters