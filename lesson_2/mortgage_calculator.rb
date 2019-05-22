require 'yaml'
MESSAGES = YAML.load_file('mortgage_calculator_messages.yml')

def prompt(key)
  message = MESSAGES[key]
  puts "=>#{message}"
end

def display_welcome
  prompt('welcome')
end

def integer?(number)
  number.to_i.to_s == number
end

def float?(number)
  number.to_f.to_s == number
end

def valid_loan?(amount)
  (integer?(amount) || float?(amount)) && amount.to_f > 0
end

def valid_interest_rate?(interest_rate)
  (integer?(interest_rate) || float?(interest_rate)) && interest_rate.to_f > 0
end

def valid_duration?(years)
  integer?(years) && years.to_i > 0
end

def retrieve_loan_amount
  amount = ''
  loop do
    prompt('loan_amount')
    amount = gets.chomp
    if valid_loan?(amount)
      break
    else
      prompt('invalid_number')
    end
  end
  amount
end

def retrieve_interest_rate
  interest_rate = ''
  loop do
    prompt('interest_rate')
    interest_rate = gets.chomp
    if valid_interest_rate?(interest_rate)
      break
    else
      prompt('invalid_number')
    end
  end
  interest_rate
end

def retrieve_duration
  years = ''
  loop do
    prompt('loan_duration')
    years = gets.chomp
    if valid_duration?(years)
      break
    else
      prompt('invalid_number')
    end
  end
  years
end

def calculate_annual_interest_rate(interest_rate)
  interest_rate.to_f / 100
end

def calculate_monthly_interest_rate(annual_interest_rate)
  annual_interest_rate.to_f / 12
end

def calculate_months(years)
  years.to_i * 12
end

def calculate_monthly_payment_rate(amount, monthly_interest_rate, months)
  amount.to_i * (monthly_interest_rate /
                         (1 - (1 + monthly_interest_rate)**-months
                         ))
end

def display_result(result)
  puts("Your monthly payment is: $#{format('%02.2f', result)}")
end

def retrieve_calculate_again
  answer = ''
  prompt('calculate_again')

  loop do
    answer = gets.chomp
    if %w(yes no y n).include?(answer.downcase)
      break
    else
      prompt('choose_yes_or_no')
    end
  end
  answer
end

def calculate_again?(answer)
  answer.downcase == 'y' || answer.downcase == 'yes'
end

def display_goodbye
  prompt('goodbye')
end

display_welcome

loop do
  amount = retrieve_loan_amount
  interest_rate = retrieve_interest_rate
  years = retrieve_duration

  annual_interest_rate = calculate_annual_interest_rate(interest_rate)
  monthly_interest_rate = calculate_monthly_interest_rate(annual_interest_rate)
  months = calculate_months(years)
  monthly_payment_rate = calculate_monthly_payment_rate(amount,
                                                        monthly_interest_rate,
                                                        months)

  display_result(monthly_payment_rate)
  answer = retrieve_calculate_again
  break unless calculate_again?(answer)
  system('clear') || system('cls')
end

display_goodbye
