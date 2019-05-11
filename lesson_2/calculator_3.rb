require 'yaml'
MESSAGES = YAML.load_file("calculator_messages.yml")
LANGUAGE = 'ja'

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

prompt('welcome')
name = ''

loop do
  name = Kernel.gets().chomp()
  if name.strip.empty?
    prompt('valid_name')
  else
    break
  end
end

Kernel.puts("=>#{Kernel.format(messages('hi'), name: name)}")

loop do
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

  result = if operator == '1'
             first_number.to_i + second_number.to_i
           elsif operator == '2'
             first_number.to_i - second_number.to_i
           elsif operator == '3'
             first_number.to_i * second_number.to_i
           else
             first_number.to_i / second_number.to_f
           end

  op = operation_to_message(operator)
  Kernel.puts("=>#{op}#{Kernel.format(messages('calculating'))}")

  Kernel.puts("=>#{Kernel.format(messages('result'), result: result)}")

  prompt('another_calculation')
  input = Kernel.gets().chomp()

  break unless input.downcase == 'y' || input.downcase == 'yes'
end

prompt('thank_you')
