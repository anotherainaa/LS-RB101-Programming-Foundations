statement = "The Flintstones Rock"

# spaces don't count

alphabet = ('a'..'z').to_a + ('A'..'Z').to_a

# Solution 1 loop way

letter_frequency = {}
counter = 0

loop do
  break if counter == statement.size

  current_letter = statement[counter]
  if alphabet.include?(current_letter)
    if letter_frequency[current_letter]
      letter_frequency[current_letter] += 1
    else
      letter_frequency[current_letter] = 1
    end
  end

  counter += 1
end

p letter_frequency