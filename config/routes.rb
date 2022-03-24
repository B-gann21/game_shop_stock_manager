Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/game_shops', to: 'game_shops#index'
  get '/game_shops/:id', to: 'game_shops#show'
end
