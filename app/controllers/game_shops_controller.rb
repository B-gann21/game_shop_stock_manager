class GameShopsController < ApplicationController
  def index
    @game_shops = GameShop.all
  end
end
