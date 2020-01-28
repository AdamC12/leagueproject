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
    player_list << 'Bye' if player_list.count.odd?
    player_list
  end

  def self.add_player(player, player_list)
    player_list << player
  end

  def self.generate_player_bracket(player_list)
    match_list = []
    match_counter = 1
    while player_list
      champion_list = ChampionGenerator.generate_champs
      champion_list = champion_list.map { |c| c == 'MonkeyKing' ? 'Wukong' : c }
      player_1_bans = []
      player_2_bans = []
      player_1 = player_list.shift
      player_2 = player_list.shift

      counter = 0
      while true
        p "#{player_1} please enter ban for #{player_2}"
        response = gets.chomp
        player_2_bans << response
        counter += 1
        if counter == 3
          player_2_champs = assign_champs(champion_list, player_2_bans)
          break
        end
      end
      counter = 0
      while true
        p "#{player_2} please enter ban for #{player_1}"
        response = gets.chomp
        player_1_bans << response
        counter += 1
        if counter == 3
          player_1_champs = assign_champs(champion_list, player_1_bans)
          break
        end
      end
      player_1_match_details = {name: player_1,
                                champs: player_1_champs.flatten,
                                bans: player_1_bans}
      player_2_match_details = {name: player_2,
                                champs: player_2_champs.flatten,
                                bans: player_2_bans}
      match_list << {match: match_counter, player_1_details: player_1_match_details, player_2_details: player_2_match_details}
      match_counter += 1
      break if player_list.empty?
    end
    GuiGenerator.create_bracket_gui(match_list)
  end


  def self.assign_champs(champ_list, ban_list)
    assigned_champs = []
    champ_list = champ_list.each do |champ|
      champ.strip.downcase
    end
    ban_list.each do |ban|
      banned_champ = ban.strip.downcase
      champ_list -= [banned_champ]
    end
    assigned_champs << champ_list.sample(3)
    assigned_champs
  end


end

