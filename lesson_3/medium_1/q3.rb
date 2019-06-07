# def factors(number)
#   divisor = number
#   factors = []
#   begin
#     factors << number / divisor if number % divisor == 0
#     divisor -= 1
#   end until divisor == 0
#   factors
# end


# def factors2(number)
#   divisor = number
#   factors = []
#   loop do
#     break if divisor <= 0
#     factors << number / divisor if number % divisor == 0
#     divisor -= 1
#   end 
#   factors
# end

# p factors2(21)
# p factors2(25)
# p factors2(5)
# p factors2(-1)

def factors3(number)
  factors = []
  for n in 1..number do
    factors << number / n if number % n == 0
  end 
  factors
end

def factors4(number)
  factors = []
  (1..number).each do |n|
    factors << number / n if number % n == 0
  end 
  factors
end

p factors4(21)
p factors4(25)
p factors4(5)
p factors4(-1)