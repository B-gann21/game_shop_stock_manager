class GameShopsController < ApplicationController
  def index
    @game_shops = GameShop.order_by_created_at
  end

  def show
    @shop = GameShop.find(params[:id])
  end

  def new
  end

  def create
    game_shop = GameShop.create(game_shop_params)
    redirect_to '/game_shops'
  end

private
  def game_shop_params
    params.permit :name, :does_repairs, :stock_limit
  end
end
