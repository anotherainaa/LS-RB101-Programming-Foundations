# Modify the code so the loop stops after the first iteration.
count = 0

loop do
  puts 'Just keep printing...'
  count += 1
  break if count == 1
end

# Or just put the break without anything else after puts
