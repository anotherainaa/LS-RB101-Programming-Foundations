require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
# LANGUAGE = 'en'

def messages(message, lang= 'en')
  MESSAGES[lang][message]
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i().to_s() == num
end

def number?(num)
  num.to_i().to_s() == num || num.to_f().to_s() == num
end

def operation_to_message(op)
  result = case op
  when '1'
    "Adding"
  when '2'
    "Subtracting"
  when '3'
    "Multiplying"
  when '4'
    "Dividing"
  end

  # some code here
  result
end

prompt(messages('welcome'))

name = ''

loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt('valid_name')
  else
    break
  end
end

# p prompt('hi')
puts(Kernel.format(messages('hi'), name: name))

loop do # main loop
  number1 = ''
  loop do
    prompt(messages('first_number'))
    number1 = Kernel.gets().chomp()

    if number?(number1)
      break
    else
      prompt(messages('invalid_number'))
    end
  end

  number2 = ''
  loop do
    prompt(messages('second_number'))
    number2 = Kernel.gets().chomp()

    if number?(number2)
      break
    else
      prompt(messages('invalid_number'))
    end
  end

  prompt(messages('operator_prompt'))

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(messages('choose_number'))
    end
  end

  prompt("#{operation_to_message(operator)} #{messages('calculating')}")

  result = case operator
           when '1'
             number1.to_i() + number2.to_i()
           when '2'
             number1.to_i() - number2.to_i()
           when '3'
             number1.to_i() * number2.to_i()
           when '4'
             number1.to_f() / number2.to_f()
           end

  prompt("#{messages('result')} #{result}")

  prompt(messages('another_calculation'))
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(messages('thank_you'))
