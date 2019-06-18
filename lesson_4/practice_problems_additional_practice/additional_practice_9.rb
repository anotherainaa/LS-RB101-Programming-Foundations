words = "the flintstones rock"
result = []
counter = 0

array = words.split

loop do
  break if counter == array.size
  current_word = array[counter]

  result << current_word.capitalize

  counter += 1
end

p result.join(' ')