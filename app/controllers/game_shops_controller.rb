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

  def edit
    @game_shop = GameShop.find(params[:id])
  end

  def update
    @game_shop = GameShop.find(params[:id])
    @game_shop.update(game_shop_params)

    redirect_to "/game_shops/#{@game_shop.id}"
  end

private
  def game_shop_params
    params.permit :name, :does_repairs, :stock_limit
  end
end
