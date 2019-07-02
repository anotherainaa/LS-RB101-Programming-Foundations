hsh = {first: ['the', 'quick'], 
second: ['brown', 'fox'], 
       third: ['jumped'], 
       fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |_, value|
  value.each do |element|
    element.chars.each do |char|
      puts char if %w(a e i o u).include?(char)
    end
  end
end

# Try again using Hash#values