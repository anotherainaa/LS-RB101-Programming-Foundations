require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals
PLAYER_MARKER = 'O'
COMPUTER_MARKER = 'X'
INITIAL_MARKER = ' '

def prompt(msg)
  puts "=>#{msg}"
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def initialize_score
  new_score = {player: 0, computer: 0}
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts "    |     |"
  puts " #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "    |     |"
  puts "----+-----+-----"
  puts "    |     |"
  puts " #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "    |     |"
  puts "----+-----+-----"
  puts "    |     |"
  puts " #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "    |     |"
end
# rubocop:enable Metrics/AbcSize

def display_score(score)
  prompt "+------------------------+"
  prompt "| Player: #{score[:player]}, Computer: #{score[:computer]} |"
  prompt "+------------------------+"
end

def empty_squares(brd)
  brd.select { |_, value| value == INITIAL_MARKER }.keys
end

def joinor(array, delimiter1 = ', ', delimiter2 = 'or')
  if array.size <= 2
    array.join(' ' + delimiter2 + ' ')
  else
    array[-1] = "#{delimiter2} #{array[-1]}"
    array.join(delimiter1)
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square: #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i

    break if empty_squares(brd).include?(square)
    prompt "Choose an empty square"
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def increment_score(winner, score)
  if winner == "Player"
    score[:player] += 1
  elsif winner == "Computer"
    score[:computer] += 1
  end
end

def grand_winner?(score)
  score[:player] == 5 || score[:computer] == 5
end

prompt 'Welcome to TIC TAC TOE!'
prompt 'First one to 5 wins is the WINNER!'
sleep(1)

loop do
  loop do
    board = initialize_board
    score = initialize_score

    loop do
      display_board(board)

      player_places_piece!(board)
      display_board(board)
      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)

    if someone_won?(board)
      winner = detect_winner(board)
      increment_score(winner, score)
      display_score(score)
      prompt "#{winner} won!"
    else
      prompt "It's a tie."
    end

    break if grand_winner(score)
  end

    prompt "Play again? (y or n)"
    answer = gets.chomp
    break if answer.include?('n')
end

prompt "Thanks for playing TIC TAC TOE!"
