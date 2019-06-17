# Find the index of the first name that starts with "Be"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# solution 1: loop

index_of_name_with_be = nil
counter = 0

loop do
  break if counter == flintstones.size

  current_name = flintstones[counter]
  if current_name.start_with?('Be')
    index_of_name_with_be = counter
    break
  end

  counter += 1
end

# p index_of_name_with_be

# Solution 2: select
# Note that this select solution does not return the index
# It needs to be found through another method below
# or paired with select #with_index

p flintstones.select {|name| name.start_with?("Be")}

# p flintstones.index(result[0])
