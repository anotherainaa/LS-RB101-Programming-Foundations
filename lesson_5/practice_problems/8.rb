hsh = {first: ['the', 'quick'], 
second: ['brown', 'fox'], 
       third: ['jumped'], 
       fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |_, value|
  value.each do |element|
    element.chars do |char|
      puts char if %w(a e i o u).include?(char)
    end
  end
end