require_relative 'bracket_methods'
require_relative 'champion_generator'

player_list = []
bracket = []
player_numbers = GenerateBracket.number_of_players
player_list = GenerateBracket.add_initial_player(player_list)
player_list = GenerateBracket.add_next_players(player_list, player_numbers)

player_list = player_list.shuffle

GenerateBracket.generate_player_bracket(player_list)




