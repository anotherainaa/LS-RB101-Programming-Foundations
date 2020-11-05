require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
PLAYERS = ['player', 'computer', 'choose']

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(board)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts "    |     |"
  puts " #{board[1]}  |  #{board[2]}  |  #{board[3]}"
  puts "    |     |"
  puts "----+-----+-----"
  puts "    |     |"
  puts " #{board[4]}  |  #{board[5]}  |  #{board[6]}"
  puts "    |     |"
  puts "----+-----+-----"
  puts "    |     |"
  puts " #{board[7]}  |  #{board[8]}  |  #{board[9]}"
  puts "    |     |"
end
# rubocop:enable Metrics/AbcSize

def display_score(score)
  prompt "+------------------------+"
  prompt "| Player: #{score[:player]}, Computer: #{score[:computer]} |"
  prompt "+------------------------+"
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def initialize_score
  score = {player: 0, computer: 0}
end

def empty_squares(board)
  board.keys.select { |num| board[num] == INITIAL_MARKER }
end

def joinor(array, delimiter1 = ', ', delimiter2 = 'or')
  if array.size <= 2
    array.join(' ' + delimiter2 + ' ')
  else
    array[-1] = "#{delimiter2} #{array[-1]}"
    array.join(delimiter1)
  end
end

def player_places_piece!(board)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(board))})"
    square = gets.chomp.to_i

    break if empty_squares(board).include?(square)
    prompt 'Sorry, that is not a valid choice.'
  end

  board[square] = PLAYER_MARKER
end

def computer_places_piece!(board)
  square = nil

  WINNING_LINES.each do |line|
    square = find_at_risk_square?(line, board, COMPUTER_MARKER)
    break if square
  end

  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square?(line, board, PLAYER_MARKER)
      break if square
    end
  end

  if !square
    square = 5 if empty_squares(board).include?(5)
  end

  if !square
    square = empty_squares(board).sample
  end

  board[square] = COMPUTER_MARKER
end

def board_full?(board)
  empty_squares(board).empty?
end

def someone_won?(board)
  !!detect_winner(board)
end

def detect_winner(board)
  WINNING_LINES.each do |line|
    if board.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif board.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def increment_score!(winner, score)
  if winner == 'Player'
    score[:player] += 1
  elsif winner == 'Computer'
    score[:computer] += 1
  end
end

def reached_score?(score)
  score[:player] == 5 || score[:computer] == 5
end

def find_at_risk_square?(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select do |key, value|
      line.include?(key) && value == INITIAL_MARKER
    end.keys.first
  else
    nil
  end
end

def retrieve_first_player
  first_player = ''
  loop do
    prompt "Choose who goes first?(#{joinor(PLAYERS)})"
    first_player = gets.chomp.to_i

    break if PLAYERS.include?(first_player)
    prompt 'Sorry, that is not a valid choice.'
  end

  first_player
end

prompt "Welcome to TIC TAC TOE!"
prompt "First one to 5 wins!"
sleep(1)

loop do
  board = initialize_board
  score = initialize_score

  loop do
    board = initialize_board
    prompt "Do you want to choose who goes first?"
    input = gets.chomp
    if input.downcase == 'y'
      first_player = retrieve_first_player
    elsif input.downcase == 'n'
      first_player = PLAYERS[0..1].sample
      prompt "#{first_player.capitalize} goes first"
      sleep(1)
    else
      prompt "That's not a valid answer"
    end

    loop do
      display_board(board)

      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)

      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)

    if someone_won?(board)
      winner = detect_winner(board)
      prompt "#{winner} won!"
      increment_score!(winner, score)
    else
      prompt "It's a tie"
    end

    display_score(score)
    sleep(1)

    break if reached_score?(score)
  end

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break if answer.downcase.start_with?("n")
end


prompt "Thanks for playing Tic Tac Toe! Good bye!!"
