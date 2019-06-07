# Shorten this sentence: ...remove everything starting from "house".
# Use slice! 

# My solution 

advice = "Few things in life are as important as house training your pet dinosaur."

# p advice.slice!("Few things in life are as important as ")
# p advice

# p new_string = advice.slice("Few things in life are as important as ")
# p new_string
# p advice

# Notes: Pay attention to return value. Notice that both slice and slice! returns the same value
# which can be captured in a new variable. 
# #slice! modifies the original variable `advice` leaving the remaining string that was not removed("sliced")
# Meanwhile, slice does nothing to the original variable `advice`

# LS Solution

p new = advice.slice!(0, advice.index('house'))
p advice
p new

# p new = advice.slice(0, advice.index('house'))
# p advice
# p new

