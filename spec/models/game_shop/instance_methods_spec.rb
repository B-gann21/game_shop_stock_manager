require 'rails_helper'

RSpec.describe GameShop do
  describe 'instance methods' do
    before :each do
      @shop1 = GameShop.create!(name: "Fred's Games", does_repairs: false, stock_limit: 3)
      @shop2 = GameShop.create!(name: "Gameville", does_repairs: false, stock_limit: 5)
      @game1 = @shop1.video_games.create!(name: "DOOM 2016", rating: "M", price: 70, multiplayer: false)
      @game2 = @shop1.video_games.create!(name: "FIFA 2020", rating: "E", price: 55, multiplayer: true)
      @game3 = @shop2.video_games.create!(name: "Elden Ring", rating: "M", price: 65, multiplayer: true)
    end

    context '#total_games_in_stock' do
      it 'returns the number of games sold by a GameShop' do
        expect(@shop1.total_games_in_stock).to eq(2)
        expect(@shop2.total_games_in_stock).to eq(1)
      end
    end
  end
end
