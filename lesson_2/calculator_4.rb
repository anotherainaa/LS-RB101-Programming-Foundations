require 'yaml'
MESSAGES = YAML.load_file("calculator_messages.yml")
LANGUAGE = 'en'

def messages(message)
  MESSAGES[LANGUAGE][message]
end

def prompt(key)
  message = messages(key)
  Kernel.puts("=>#{message}")
end

def integer?(number)
  number.to_i.to_s == number
end

def float?(number)
  number.to_f.to_s == number
end

def valid_name?(name)
  name.strip.empty?
end

def valid_number?(number)
  integer?(number) || float?(number)
end

def operation_to_message(operator)
  result = case operator
           when '1'
             'Adding'
           when '2'
             'Subtracting'
           when '3'
             'Multiplying'
           when '4'
             'Dividing'
           end

  # line of code here
  result
end

def display_welcome
  prompt('welcome')
end

def retrieve_user_name
  name = ''
  loop do
    name = Kernel.gets().chomp()
    if valid_name?(name)
      prompt('valid_name')
    else
      break
    end
  end
  Kernel.puts("=>#{Kernel.format(messages('hi'), name: name)}")
end

def retrieve_number
  first_number = ''
  loop do
    prompt('first_number')
    first_number = Kernel.gets().chomp()
    if valid_number?(first_number)
      break
    else
      prompt('invalid_number')
    end
  end
  first_number
end

def retrieve_second_number
  second_number = ''
  loop do
    prompt('second_number')
    second_number = Kernel.gets().chomp()
    if valid_number?(second_number)
      break
    else
      prompt('invalid_number')
    end
  end
  second_number
end

def retrieve_operation
  operator = ''
  loop do
    prompt('operator_prompt')
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt('choose_number')
    end
  end
  operator
end

def calculate_result(operator, first_number, second_number)
  result = if operator == '1'
             first_number.to_i + second_number.to_i
           elsif operator == '2'
             first_number.to_i - second_number.to_i
           elsif operator == '3'
             first_number.to_i * second_number.to_i
           else
             first_number.to_i / second_number.to_f
           end
  result
end

def display_result(operator, result)
  Kernel.puts("=>#{operator}#{Kernel.format(messages('calculating'))}")
  Kernel.puts("=>#{Kernel.format(messages('result'), result: result)}")
end

def retrieve_play_again
  prompt('another_calculation')
  Kernel.gets().chomp()
end

def play_again?(answer)
  answer.downcase == 'y' || answer.downcase == 'yes'
end

def display_goodbye
  prompt('thank_you')
end

display_welcome

retrieve_user_name

loop do
  first_number = retrieve_number
  second_number = retrieve_second_number
  # refactor this to second number
  operator = retrieve_operation

  result = calculate_result(operator, first_number, second_number)

  operator = operation_to_message(operator)

  display_result(operator, result)

  answer = retrieve_play_again
  break unless play_again?(answer)
end

display_goodbye
