require 'pry'

SUITS = ['H', 'D', 'S', 'C']
CARDS = ['Ace', '2', '3', '4', '5', '6', '7', '8', '9', 'Jack', 'Queen', 'King']

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  []
end

def deal_card(cards)
  cards << [SUITS.sample, CARDS.sample]
end

def calculate(cards)
  values = cards.map { |card| card[1] }
  sum = 0

  sum += values.each do |value|
    if value == "Ace"
      11
    elsif value.to_i == 0
      10
    else
      value.to_i
    end
  end

  values.select { |value| value == "Ace" }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def busted?(cards)
  calculate(cards) > 21
end

def joinor(array)
  if array.size <= 2
    array.join(" and ")
  else
    array[-1] = "and #{array[-1]}"
    array.join(", ")
  end
end

def display_player(cards)
  values = cards.map { |card| card[1] }
  prompt "You have: #{joinor(values)}"
end

def display_dealer(cards)
  prompt "Dealer has: #{cards[0][1]} and unknown card"
end

def calculate_winner(player_cards, dealer_cards)
  player_score = calculate(player_cards)
  dealer_score = calculate(dealer_cards)

  if player_score > dealer_score
    "player"
  else
    "dealer"
  end
end

def display_result(winner)
  if winner == "player"
    prompt "You win!"
  else
    prompt "Dealer wins!"
  end
end

prompt "Welcome to BLACKJACK!"
sleep(1)

loop do
  player_cards = initialize_deck
  dealer_cards = initialize_deck
  2.times { deal_card(player_cards) }
  2.times { deal_card(dealer_cards) }

  display_dealer(dealer_cards)
  display_player(player_cards)

  answer = nil
  loop do
    prompt "hit or stay?"
    answer = gets.chomp

    if answer.include?("h")
      deal_card(player_cards)
      display_player(player_cards)
    end

    break if answer == 'stay' || busted?(player_cards)
  end

  if busted?(player_cards)
    prompt "You busted! Dealer wins!"
  else
    prompt "You chose to stay!"
    prompt "Dealer's turn"

    loop do
      total = calculate(dealer_cards)
      break if total >= 17 || busted?(dealer_cards)

      prompt "Dealer chose hit!"
      deal_card(dealer_cards)
    end

    if busted?(dealer_cards)
      prompt "Dealer busted! You win!"
    else
      prompt "Dealer chose to stay!"
      prompt "Dealer's score is #{calculate(dealer_cards)}."
      prompt "Your score is #{calculate(player_cards)}."
      winner = calculate_winner(player_cards, dealer_cards)
      display_result(winner)
    end
  end

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break if answer.downcase.start_with?("n")
end

prompt "Thanks for playing BLACK JACK! Bye!"
