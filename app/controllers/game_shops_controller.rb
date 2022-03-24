class GameShopsController < ApplicationController
  def index
    @game_shops = GameShop.all
  end

  def game_index
    @video_games = VideoGame.all
  end

  def show
    @shop = GameShop.find(params[:id])
  end
end
