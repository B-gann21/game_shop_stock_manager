class ShopGamesController < ApplicationController
  def index
    @shop = GameShop.find(params[:id])
    @video_games = VideoGame.all
  end
end
