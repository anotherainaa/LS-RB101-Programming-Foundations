def integer?(number)
  number.to_i.to_s == number
end

def float?(number)
  number.to_f.to_s == number
end

def valid_loan?(amount)
  integer?(amount) && amount.to_f > 0
end

def valid_apr?(apr)
  integer?(apr) || float?(apr) && apr.to_f > 0
end

def valid_years?(years)
  integer?(years) && years.to_i > 0
end

def prompt(message)
  puts "=>#{message}"
end

prompt("Welcome to Mortgage calculator")

loop do
  amount = ''
  loop do
    prompt("What is the total amount of loan in dollars? (i.e 10000)")
    amount = gets.chomp
    if valid_loan?(amount)
      break
    else
      prompt("Please enter a valid postive number.")
    end
  end

  annual_percentage_rate = ''
  loop do
    prompt("What is the Annual Percentage Rate? (i.e 7 or 7.0 for 7%)")
    annual_percentage_rate = gets.chomp
    if valid_apr?(annual_percentage_rate)
      break
    else
      prompt("Please enter a valid postive number.")
    end
  end

  years = ''
  loop do
    prompt("What is the loan duration in years? (i.e 30)")
    years = gets.chomp
    if valid_years?(years)
      break
    else
      prompt("Please enter a valid positive number.")
    end
  end

  monthly_interest_rate = annual_percentage_rate.to_f / 100 / 12
  months = years.to_i * 12
  monthly_payment_rate = amount.to_i * (monthly_interest_rate /
                         (1 - (1 + monthly_interest_rate)**-months
                         ))

  # prompt("Your monthly payment is $#{monthly_payment_rate.round(2)}")
  prompt("Your monthly payment is: $#{format('%02.2f', monthly_payment_rate)}")


  prompt("Do you want to calculate again? (Y to go again)")
  input = gets.chomp
  break unless input.downcase == 'y' || input.downcase == 'yes'
end

prompt("Thank you for using the Mortgage calculator. Goodbye")
