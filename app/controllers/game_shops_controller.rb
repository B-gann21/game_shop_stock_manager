class GameShopsController < ApplicationController
  def index
    @game_shops = GameShop.all.order('created_at')
  end

  def show
    @shop = GameShop.find(params[:id])
  end
end
