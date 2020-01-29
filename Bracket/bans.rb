# frozen_string_literal: true

class ChampionBans

  def self.generate_ban_list(first_player, second_player, champion_list)
    counter = 0
    bans = []
    while true
      p "#{first_player} please enter ban for #{second_player}"
      response = gets.chomp
      response = titlecase(response)
      response = response.delete(' ')
      banned_champions = ChampionBans.ban_champions(champion_list, response)
      bans << banned_champions
      counter += 1
      break if counter == 3
    end
    bans
  end


  def self.ban_champions(champion_list, banned_champion)
    unless champion_list.include? banned_champion
      p "Entry for ban: #{banned_champion} not found, banning a random champ! Spell better next time :D"
      banned_champion = champion_list.sample(1).to_s
    end
    banned_champion
  end

  def self.titlecase(string)
    string.split(/([[:alpha:]]+)/).map(&:capitalize).join
  end
end
