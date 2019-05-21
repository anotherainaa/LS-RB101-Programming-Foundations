require 'pry'
VALID_CHOICES = %w(rock paper scissors lizard spock)

def display_welcome
  prompt("Welcome to Rock Paper Scissors Spock Lizard")
  prompt("First one to win 5 games wins")
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'rock' && second == 'lizard') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'paper' && second == 'spock') ||
    (first == 'scissors' && second == 'paper') ||
    (first == 'scissors' && second == 'lizard') ||
    (first == 'spock' && second == 'scissors') ||
    (first == 'spock' && second == 'rock') ||
    (first == 'lizard' && second == 'paper') ||
    (first == 'lizard' && second == 'spock')
end

def calculate_result(player, computer)
  if win?(player, computer)
    "You won!"
  elsif win?(computer, player)
    "Computer won!"
  else
    "It's a tie!"
  end
end

def display_result(result)
  prompt("#{result}")
end

def compute_computer_choice
  VALID_CHOICES.sample()
end

def display_choices
  prompt("Choose one:")
  VALID_CHOICES.each do |choice|
    Kernel.puts("#{choice[0..1]} for #{choice}")
  end
end

def abbreviate_valid_choice
  VALID_CHOICES.map do |choice|
    choice[0..1]
  end
end

def valid_choice?(input)
  VALID_CHOICES.include?(input) || abbreviate_valid_choice.include?(input)
end

def convert_valid_choice(input)
  VALID_CHOICES.find do |choice|
    choice.start_with?(input)
  end
end

def retrieve_player_choice
  choice = ''
  loop do
    display_choices
    choice = Kernel.gets().chomp()

    if valid_choice?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end
  choice = convert_valid_choice(choice)
end

def retrieve_play_again
  answer = ''
  loop do
    prompt("Do you want to play again? ")
    answer = Kernel.gets().chomp()

    if %w(yes no y n).include?(answer.downcase)
      break
    else
      prompt("Must choose yes or no.")
    end
  end
  answer
end

def play_again?(answer)
  answer.downcase == 'yes' || answer.downcase == 'y'
end

def display_chosen_choices(player, computer)
  prompt("You chose: #{player}; Computer chose: #{computer}")
end

def display_score(player, computer)
  prompt("Your score: #{player}; Computer score:#{computer}")
end

def calculate_score(result, score)
  if result == 'You won!'
    score[:player] += 1
  elsif result == 'Computer won!'
    score[:computer] += 1
  end
  score
end

def display_score(score)
  prompt("Player score: #{score[:player]}; Computer score: #{score[:computer]}")
end

def game_ended?(score)
  score[:player] == 5 || score[:computer] == 5
end

def display_end_game_message(score)
  if score[:player] == 5
    prompt("Congrats! You're the GRAND winner!")
  else
    prompt("Too bad. Computer won the game.")
  end
end

display_welcome

loop do
  score = { player: 0, computer: 0}

  loop do
    choice = retrieve_player_choice
    computer_choice = compute_computer_choice

    display_chosen_choices(choice, computer_choice)
    result = calculate_result(choice, computer_choice)
    display_result(result)

    score = calculate_score(result, score)

    display_score(score)

    break if game_ended?(score)
  end

  display_end_game_message(score)

  answer = retrieve_play_again
  break unless play_again?(answer)
  system('clear') || system('cls')
end

prompt('Thank you for playing. Goodbye!')
