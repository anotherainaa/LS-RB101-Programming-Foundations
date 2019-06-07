string = 'The Flintstones Rock!'

count = 1
line_width = string.length

until count >= 10 do
  puts string.rjust(line_width)
  count += 1
  line_width += 1
end