class ShopGamesController < ApplicationController
  def index
    @shop = GameShop.find(params[:id])
    @video_games = @shop.video_games
  end

  def new
  end
end
