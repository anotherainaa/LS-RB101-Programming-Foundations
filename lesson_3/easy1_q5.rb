# Question 5
# Programmatically determine if 42 lies between 10 and 100.

# hint: Use Ruby's range object in your solution.

(10..100).include?(42)

# LS Solution

(10..100).cover?(42)

# Note: Method #cover does more things in Ruby 2.6 like being able to pass range as an argument
# Should check the docs when using #cover method.