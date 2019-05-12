def calculate_monthly_percentage(yearly_rate)
  yearly_rate / 12
end

def calculate_loan_months(duration_in_year)
  duration_in_year * 12
end

def calculate_monthly_payment(loan_amount,
                              monthly_interest_rate,
                              duration_in_months)
  p = loan_amount
  j = monthly_interest_rate
  n = duration_in_months

  p * (j / (1 - (1 + j)**-n))
end

def prompt(message)
  puts "=>#{message}"
end

prompt("Welcome to Mortgage calculator")

loop do
  loan_amount = ''
  loop do
    prompt("What is the total amount of loan in dollars? (i.e 10000)")
    loan_amount = gets.chomp.to_i
    if loan_amount <= 0
      prompt("Please enter a valid number.")
    else
      break
    end
  end

  annual_percentage_rate = ''
  loop do
    prompt("What is the Annual Percentage Rate? (i.e 7%)")
    annual_percentage_rate = gets.chomp.to_f / 100
    if annual_percentage_rate <= 0
      prompt("Please enter a valid number")
    else
      break
    end
  end

  loan_duration_years = ''
  loop do
    prompt("What is the loan duration in years? (i.e 30)")
    loan_duration_years = gets.chomp.to_i
    if loan_duration_years < 0
      prompt("Please enter a valid number")
    else
      break
    end
  end

  monthly_percentage_rate = calculate_monthly_percentage(annual_percentage_rate)
  loan_duration_months = calculate_loan_months(loan_duration_years)
  monthly_payment_rate = calculate_monthly_payment(loan_amount,
                                                   monthly_percentage_rate,
                                                   loan_duration_months)

  monthly_payment_message = "Your monthly payment is "\
                            "$#{monthly_payment_rate.round(2)} "\
                            "to be paid in #{loan_duration_months} months"

  prompt(monthly_payment_message)

  prompt("Do you want to calculate again? (Y to go again)")
  input = gets.chomp
  break unless input.downcase == 'y' || input.downcase == 'yes'
end

prompt("Thank you for using the Mortgage calculator. Goodbye")
