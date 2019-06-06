# Question 6
# Starting with the string:

famous_words = "seven years ago..."
# show two different ways to put the expected "Four score and " in front of it.

# Solution 1 

# famous_words.prepend("Four score and ")
# p famous_words

# Solution 2

famous_words.insert(0, "Four score and ")
p famous_words