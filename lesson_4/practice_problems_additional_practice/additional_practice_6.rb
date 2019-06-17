flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# solution 1: map

result = flintstones.map do |name|
  name[0..2] # You can also do name[0, 3] which is more readable
end

# p result

# solution 2: loop

shortened_name = []
counter = 0

loop do
  break if counter == flintstones.size

  currrent_name = flintstones[counter]
  shortened_name << currrent_name[0, 3]

  counter += 1
end

p shortened_name