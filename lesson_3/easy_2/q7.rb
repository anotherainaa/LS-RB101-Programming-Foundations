# In the previous practice problem we added Dino to our array like this:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# My solution
# flintstones.push('Dino', 'Hoppy')
# p flintstones

# LS Solution 1
# flintstones.push('Dino').push('Hoppy') # push returns the array so we can chain
# p flintstones

# LS Solution 2
flintstones.concat(%w(Dino Hoppy)) # concat adds an array rather than one item
p flintstones


