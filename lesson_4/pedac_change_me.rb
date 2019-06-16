require 'pry'

# PROBLEM:

# Given a string, write a method change_me which returns the same
# string but with all the words in it that are palindromes uppercased.

# input: string
# output: string (not the same object)
# rules:
#      Explicit requirements:
#        - every palindrome in the string must be converted to
#          uppercase. (Reminder: a palindrome is a word that reads
#          the same forwards and backward).
#        - Palindromes are case sensitive ("Dad" is not a palindrome, but "dad" is.)

#      Implicit requirements:
#        - the returned string shouldn't be the same string object.

# Data structure Algorithm
# Array > string

#  - create method change_me
#  - initialize variable result to store the final string
#  - split the string into each word by calling #split
#  - initialize iterator to iterate through the array
#  - iterate through the array
#  - call method reverse on each word and check if it is the same as the original word
#  - if yes, the word is a palindrom, return the word in upcase
#  - if no, return the word as is
#  - finish iteration
#  - use .join with space to turn the array into a string.

def change_me(string)
  return "" if string == ""
  result = []
  words = string.split
  iterator = 0
  loop do
    word = words[iterator]
    binding.pry
    if word.reverse == word
      result << word.upcase
    else
      result << word
    end
    iterator += 1
    break if iterator == words.size
  end
  result.join(' ')
end

p change_me("We will meet at noon") == "We will meet at NOON"
p change_me("No palindromes here") == "No palindromes here"
p change_me("") == ""
p change_me("I LOVE my mom and dad equally") == "I LOVE my MOM and DAD equally"

