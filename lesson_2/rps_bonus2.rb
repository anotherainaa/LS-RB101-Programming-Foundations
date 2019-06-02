WIN_CONDITION = {
  rock: { abbr: 'ro', beats: %w(scissors lizard) },
  paper: { abbr: 'pa', beats: %w(rock spock) },
  scissors: { abbr: 'sc', beats: %w(lizard paper) },
  spock: { abbr: 'sp', beats: %w(scissors rock) },
  lizard: { abbr: 'li', beats: %w(paper spock) }
}

def display_welcome
  prompt("Welcome to Rock Paper Scissors Spock Lizard!")
  prompt("First one to win 5 games wins.")
  prompt("---------------------------------")
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  WIN_CONDITION[first.to_sym][:beats].include?(second)
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

def compute_computer_choice
  WIN_CONDITION.keys.sample().to_s()
end

def display_valid_choices
  prompt("Choose one:")
  WIN_CONDITION.keys.each do |choice|
    Kernel.puts("#{choice[0..1]} for #{choice}")
  end
end

def valid_choice?(input)
  WIN_CONDITION.keys.include?(input.downcase.to_sym) ||
    WIN_CONDITION.any? { |_, hash| hash[:abbr] == input.downcase }
end

def convert_abbreviation_to_valid_choice(input)
  valid_choice = WIN_CONDITION.keys.find do |choice|
    choice.to_s.start_with?(input.downcase)
  end
  valid_choice.to_s
end

def retrieve_player_choice
  choice = ''
  loop do
    display_valid_choices
    choice = Kernel.gets().chomp()

    if valid_choice?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end
  choice = convert_abbreviation_to_valid_choice(choice)
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

def play_again?
  answer = retrieve_play_again
  answer.downcase == 'yes' || answer.downcase == 'y'
end

def display_chosen_choices(player, computer)
  prompt("You chose: #{player}; Computer chose: #{computer}")
end

def calculate_score(result, score)
  if result == 'You won!'
    score[:player] += 1
  elsif result == 'Computer won!'
    score[:computer] += 1
  end
end

def display_score(result, score)
  calculate_score(result, score)
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
  score = { player: 0, computer: 0 }

  loop do
    choice = retrieve_player_choice
    system('clear') || system('cls')
    computer_choice = compute_computer_choice
    display_chosen_choices(choice, computer_choice)
    result = calculate_result(choice, computer_choice)
    prompt(result)
    display_score(result, score)

    break if game_ended?(score)
  end

  display_end_game_message(score)

  break unless play_again?
  system('clear') || system('cls')
end

prompt('Thank you for playing. Goodbye!')
