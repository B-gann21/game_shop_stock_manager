Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/game_shops', to: 'game_shops#index'
  get '/game_shops/:id', to: 'game_shops#show'
  get '/game_shops/:id/video_games', to: 'game_shops#game_index'
  get '/video_games', to: 'video_games#index'
  get '/video_games/:id', to: 'video_games#show'
end
