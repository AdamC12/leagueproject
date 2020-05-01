class PlayerformController < ApplicationController
  def new
  end
  def number_of_players
    @number_of_players = params[:playerform][:number_of_players].to_i
    @champion_list = File.read("../Bracket/champs_list.csv").split(",")
  end
  def player_names
    @player_names
    #https://stackoverflow.com/questions/18424671/what-is-params-requireperson-permitname-age-doing-in-rails-4
    # 
    # visit this for future work
  end
end
