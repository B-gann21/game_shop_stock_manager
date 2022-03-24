class GameShopsController < ApplicationController
  def index
    @game_shops = GameShop.all
  end

  def show
    @shop = GameShop.find(params[:id])
  end
end
