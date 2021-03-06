require 'rails_helper'

RSpec.describe GameShop do
  describe 'instance methods' do
    before :each do
      VideoGame.destroy_all
      GameShop.destroy_all

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

    context '#order_by_created_at' do
      it 'orders all entries by most recently created' do
        expect(GameShop.order_by_created_at).to eq([@shop2, @shop1])
      end
    end

    context '#alphabetized_video_games' do
      before do
        @game4 = @shop1.video_games.create(name: "Elephant Simulator", rating: "M 17+", price: 60, multiplayer: true)
      end

      it 'sorts games by their names' do
        expect(@shop1.alphabetized_video_games).to eq([@game1, @game4, @game2])
      end
    end

    context '#games_over_price(price)' do
      before do
        @game4 = @shop1.video_games.create(name: "Elephant Simulator", rating: "M 17+", price: 60, multiplayer: true)
      end

      it 'only shows games above the given price' do
        expect(@shop1.games_over_price(55)).to eq([@game1, @game4])
      end
    end
  end
end
