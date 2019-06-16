def greeting
  puts 'Hello!'
end

number_of_greetings = 2

count = 0
while count < number_of_greetings
  greeting
  count += 1
end

# LS solution

while number_of_greetings > 0
  greeting
  number_of_greetings -= 1
end