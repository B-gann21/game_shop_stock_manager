require 'rails_helper'

RSpec.describe 'VideoGames' do
  before :each do
    @shop1 = GameShop.create!(name: "Fred's Games", does_repairs: false, stock_limit: 3)
    @shop2 = GameShop.create!(name: "Gameville", does_repairs: false, stock_limit: 5)
    @shop3 = GameShop.create!(name: "GoodGames", does_repairs: false, stock_limit: 5)
    @game1 = @shop1.video_games.create!(name: "DOOM 2016", rating: "M", price: 70, multiplayer: false)
    @game2 = @shop1.video_games.create!(name: "FIFA 2020", rating: "E", price: 55, multiplayer: true)
    @game3 = @shop1.video_games.create!(name: "Elden Ring", rating: "M", price: 65, multiplayer: true)

    visit '/video_games'
  end

  context '#index' do
    it 'displays all VideoGame names' do
      expect(page).to have_content(@game1.name)

      expect(page).to have_content(@game2.name)

      expect(page).to have_content(@game3.name)
    end

    it 'displays attributes next to their VideoGame' do
      within "#video-game-#{@game1.id}" do
        expect(page).to have_content(@game1.name)
        expect(page).to have_content(@game1.id)
        expect(page).to have_content(@game1.rating)
        expect(page).to have_content(@game1.price)
        expect(page).to have_content(@game1.multiplayer)
        expect(page).to have_content(@game1.created_at)
        expect(page).to have_content(@game1.updated_at)
      end

      within "#video-game-#{@game2.id}" do
        expect(page).to have_content(@game2.name)
        expect(page).to have_content(@game2.id)
        expect(page).to have_content(@game2.rating)
        expect(page).to have_content(@game2.price)
        expect(page).to have_content(@game2.multiplayer)
        expect(page).to have_content(@game2.created_at)
        expect(page).to have_content(@game2.updated_at)
      end

      within "#video-game-#{@game3.id}" do
        expect(page).to have_content(@game3.name)
        expect(page).to have_content(@game3.id)
        expect(page).to have_content(@game3.rating)
        expect(page).to have_content(@game3.price)
        expect(page).to have_content(@game3.multiplayer)
        expect(page).to have_content(@game3.created_at)
        expect(page).to have_content(@game3.updated_at)
      end
    end
  end
end
