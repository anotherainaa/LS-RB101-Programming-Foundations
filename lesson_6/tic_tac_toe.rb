require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts msg.to_s
end

# rubocop:disable Metrics/AbcSize
def display_board(board)
  system 'clear' || system('cls')
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

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
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
  square = empty_squares(board).sample
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

loop do
  board = initialize_board

  loop do
    display_board(board)

    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)

    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie"
  end

  prompt "Play again? (y or n)"
  answer = gets.chomp

  break if answer.downcase.start_with?("n")
end

prompt "Thanks for playing Tic Tac Toe! Good bye!"



