class GameShopsController < ApplicationController
  def index
    @game_shops = GameShop.order_by_created_at
  end

  def show
    @shop = GameShop.find(params[:id])
  end
end
