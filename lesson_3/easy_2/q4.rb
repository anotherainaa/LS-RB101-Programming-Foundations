# See if the name "Dino" appears in the string below:

advice = "Few things in life are as important as house training your pet dinosaur."

p advice.include?("Dino")

# LS Solution
# Notes: the solution below is only available from version 2.4.0
# The diff to #include? is that it converts pattern into regexp? 
# You can also define a second optional argument to to specify the position to begin search

# p advice.match?("Dino")