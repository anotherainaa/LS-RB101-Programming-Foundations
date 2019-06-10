# Original 

# def dot_separated_ip_address?(input_string)
#   dot_separated_words = input_string.split(".")
#   while dot_separated_words.size > 0 do
#     word = dot_separated_words.pop
#     break unless is_an_ip_number?(word)
#   end
#   return true
# end

# Fixes

def valid_ip?(array)
  array.length == 4
end

def is_an_ip_number?(word)
  (0..255).include?(word.to_i)
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  
  return false unless valid_ip?(dot_separated_words)

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end
  return true
end

p dot_separated_ip_address?("126.94.62.344")
