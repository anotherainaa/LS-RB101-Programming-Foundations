ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# returns false
p ages.has_key?("spot")
p ages.include?("spot")
p ages.member?("spot")

#returns nil 
p ages.assoc("spot")
p ages["spot"]