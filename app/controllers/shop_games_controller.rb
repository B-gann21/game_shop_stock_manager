class ShopGamesController < ApplicationController
  def index
    @shop = GameShop.find(params[:id])
    @video_games = @shop.video_games
  end

  def new
    @game_shop = GameShop.find(params[:id])
  end

  def create
    game_shop = GameShop.find(params[:id])
    game_shop.video_games.create(video_game_params)
    redirect_to "/game_shops/#{game_shop.id}/video_games"
  end

private
  def video_game_params
    params.permit :name, :rating, :price, :multiplayer
  end
end
