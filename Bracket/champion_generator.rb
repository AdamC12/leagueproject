# frozen_string_literal: true

# test
require 'net/http'
require 'json'
# class ChampionGenerator
#   #
#   # def generate_champs
#   #   File.read
#   # end

def download_champions
  riot_types = Net::HTTP.get('ddragon.leagueoflegends.com', '/realms/euw.json')
  champ_version = JSON.parse(riot_types)['n']['champion']
  p champ_version
  champ_list = Net::HTTP.get('ddragon.leagueoflegends.com', "/cdn/#{champ_version}/data/en_GB/champion.json")
  champions = JSON.parse(champ_list)
  champion_list = []
  champions['data'].each do |hash|
    champion_list << hash.first
  end
  champion_list
end
# end
