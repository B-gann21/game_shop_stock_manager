require 'rails_helper'

RSpec.describe "ShopGames#new" do
  before :each do
    @shop1 = GameShop.create!(name: "Fred's Games", does_repairs: false, stock_limit: 3)
    @shop2 = GameShop.create!(name: "Gameville", does_repairs: false, stock_limit: 5)
    @game1 = @shop1.video_games.create!(name: "DOOM 2016", rating: "M", price: 70, multiplayer: false)
    @game2 = @shop1.video_games.create!(name: "FIFA 2020", rating: "E", price: 55, multiplayer: true)
    @game3 = @shop2.video_games.create!(name: "Elden Ring", rating: "M", price: 65, multiplayer: true)

    visit "/game_shops/#{@shop1.id}/video_games"
  end

  context 'functionality of ShopGames#new link' do
    it 'ShopGames#index page should have a link to create a new video game' do
      expect(page).to have_link("Add to stock")
    end

    it 'Add to stock should take you to the new Video Game page' do
      click_link "Add to stock"

      expect(current_path).to eq("/game_shops/#{@shop1.id}/video_games/new")
    end
  end

  context 'creating a new VideoGame' do
    it 'submitting the form should show the new VideoGame' do
      click_link "Add to stock"

      fill_in :name, with: "Monster Hunter: Rise"
      fill_in :rating, with: "T"
      fill_in :price, with: "60"
      check :multiplayer
      click_button "Add to #{@shop1.name} stock"

      expect(current_path).to eq("/game_shops/#{@shop1.id}/video_games")
      expect(page).to have_content("Monster Hunter: Rise")
    end
  end
end
