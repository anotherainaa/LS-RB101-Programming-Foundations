# Question 3
# Replace the word "important" with "urgent" in this string:

advice = "Few things in life are as important as house training your pet dinosaur."

# revised_advice = []
# advice.split.each do |word|
#   if word == 'important'
#     revised_advice << 'urgent' 
#   else   
#     revised_advice << word
#   end
# end

# p revised_advice.join(' ')

advice.gsub!('important', 'urgent')
p advice