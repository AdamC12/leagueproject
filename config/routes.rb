Rails.application.routes.draw do
  get 'playerform/new'
  post 'playerform', :controller => 'playerform', :action => 'number_of_players'
  post 'player_names', :controller => 'playerform', :action => 'player_names'
  root 'homepage#index'
  get 'homepage/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
