require_relative 'champion_generator'

class GenerateBracket

  def self.number_of_players
    while true
      p 'How many players are entering the tournament?'
      begin
        number = Integer(gets.chomp)
        break
      rescue
        p 'Please enter an integer'
      end
    end
    number
  end

  def self.add_initial_player(player_list)
    p 'Insert name of first player:'
    player = gets.chomp
    player_list << player
    player_list
  end

  def self.add_next_players(player_list, player_numbers)
    counter = (player_numbers.to_i - 1)
    while counter.positive?
      p 'Insert name of next player'
      player = gets.chomp
      add_player(player, player_list)
      counter -= 1
    end
    if player_list.count.odd?
      player_list << 'Bye'
    end
    player_list
  end

  def self.add_player(player, player_list)
    player_list << player
  end

  def self.generate_player_bracket(player_list, bracket)
    match_number = (player_list.count / 2)
    champion_list = generate_champs
    while match_number.positive?
      match = {'Player 1: ' => {'Name: ' => player_list.shift,
                                'Champs: ' => assign_champs(champion_list)},
               'Player 2: ' => {'Name: ' => player_list.shift,
                                'Champs: ' => assign_champs(champion_list)}}
      bracket << "Match #{match_number} : #{match}"
      match_number -= 1
    end
    bracket.reverse
  end

  def self.generate_champs
    champ_list = []
    downloaded_champs = download_champions
    downloaded_champs.each do |champion|
      champ_list << champion
    end
    champ_list
  end

  def self.assign_champs(champ_list)
    assigned_champs = []
    assigned_champs << champ_list.sample(3)
    assigned_champs
  end

end
