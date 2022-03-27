require 'rails_helper'

RSpec.describe 'GameShop#new' do
  before :each do
    @shop1 = GameShop.create!(name: "Fred's Games", does_repairs: false, stock_limit: 3)
    @shop2 = GameShop.create!(name: "Gameville", does_repairs: false, stock_limit: 5)
    @shop3 = GameShop.create!(name: "GoodGames", does_repairs: false, stock_limit: 5)
    @game1 = @shop1.video_games.create!(name: "DOOM 2016", rating: "M", price: 70, multiplayer: false)
    @game2 = @shop1.video_games.create!(name: "FIFA 2020", rating: "E", price: 55, multiplayer: true)
    @game3 = @shop2.video_games.create!(name: "Elden Ring", rating: "M", price: 65, multiplayer: true)

    visit '/game_shops'
  end

  context 'New Game Shop link functionality' do
    it 'should have a link called New Game Shop' do
      expect(page).to have_link("New Game Shop")
    end

    it 'should take you to /game_shops/new' do
      click_link("New Game Shop")

      expect(current_path).to eq('/game_shops/new')
    end
  end

  context 'creating a Game Shop' do
    it 'after submitting the form, you see your new Game Shop' do
      click_link("New Game Shop")

      fill_in('Name', with: 'The Spot')
      check :does_repairs
      fill_in('Stock limit', with: '7')

      click_button "Create Game Shop"

      expect(current_path).to eq('/game_shops')
      expect(page).to have_content('The Spot')
    end
  end
end
