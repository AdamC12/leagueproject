# p 'Insert number of players:'
# number_of_players = gets

# create_player_list


# def create_player_list


def add_initial_player(player_list)
  p 'Insert name of first player:'
  player = gets
  player_list << player
  player_list
end

def add_next_players(response, player_list)
  while true
    if response.downcase == 'yes'
      p 'Insert name of next player'
      player = gets.chomp
      add_player(player, player_list)
    elsif response.downcase == 'no'
      break
    else
      p 'Must be yes or no'
    end
  end
end


def add_player(player, player_list)
  player_list << player
end


player_list = []
player_list = add_initial_player(player_list)
player_list = add_next_players(player_list)


p player_list


# end

# bracket_creator(number_of_players)
#
#
# def bracket_creator(players)
#   players.each do |player|
#
#   end
# end

