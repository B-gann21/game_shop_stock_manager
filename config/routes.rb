Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/game_shops', to: 'game_shops#index'
  get '/game_shops/new', to: 'game_shops#new'
  post '/game_shops', to: 'game_shops#create'
  get '/game_shops/:id', to: 'game_shops#show'
  patch '/game_shops/:id', to: 'game_shops#update'
  delete '/game_shops/:id', to: 'game_shops#destroy'
  get 'game_shops/:id/edit', to: 'game_shops#edit'

  get '/game_shops/:id/video_games', to: 'shop_games#index'
  post 'game_shops/:id/video_games', to: 'shop_games#create'
  get 'game_shops/:id/video_games/new', to: 'shop_games#new'

  get '/video_games', to: 'video_games#index'
  get '/video_games/:id', to: 'video_games#show'
  patch '/video_games/:id', to: 'video_games#update'
  delete '/video_games/:id', to: 'video_games#destroy'
  get '/video_games/:id/edit', to: 'video_games#edit'
end
