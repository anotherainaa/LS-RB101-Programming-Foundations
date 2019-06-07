string = 'The Flintstones Rock!'

# My solution 

count = 1
line_width = string.length

until count >= 10 do
  puts string.rjust(line_width)
  count += 1
  line_width += 1
end

# LS Solution

10.times {|number| puts (" " * number) + string }