# Question 6
# Starting with the string:

famous_words = "seven years ago..."
# show two different ways to put the expected "Four score and " in front of it.

# Solution 1 
# Notes: This seems to modify the original object

# famous_words.prepend("Four score and ")
# p famous_words

# Solution 2
# Notes: This seems to modify the original object

famous_words.insert(0, "Four score and ")
p famous_words

# LS Solutions

# Notes: This solution does not modify the original object and must be saved in a new variable
"Four score and " + famous_words

# Notes: Same as my first solution.
famous_words.prepend("Four score and ")

# Notes: This solution does not modify the original object and must be saved in a new variable
"Four score and " << famous_words