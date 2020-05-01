# frozen_string_literal: true

# test
require 'net/http'
require 'json'

class ChampionGenerator

  def self.download_champions
    require 'pry'
    riot_types = Net::HTTP.get('ddragon.leagueoflegends.com', '/realms/euw.json')
    champ_version = JSON.parse(riot_types)['n']['champion']
    champ_list = Net::HTTP.get('ddragon.leagueoflegends.com',
                               "/cdn/#{champ_version}/data/en_GB/champion.json")
    champions = JSON.parse(champ_list)
    champion_list = []
    champions['data'].each do |hash|
      champion_list << hash.first
    end
    binding.pry
    champion_list
  end

  def self.generate_champs
    champ_list = []
    downloaded_champs = download_champions
    downloaded_champs.each do |champion|
      champ_list << champion
    end
    champ_list
  end

end
