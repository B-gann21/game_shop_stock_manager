require 'rails_helper'

RSpec.describe "GameShops#delete" do
  before :each do
    VideoGame.destroy_all
    GameShop.destroy_all
    
    @shop1 = GameShop.create!(name: "Fred's Games", does_repairs: false, stock_limit: 3)
    @shop2 = GameShop.create!(name: "Gameville", does_repairs: false, stock_limit: 5)
    @shop3 = GameShop.create!(name: "GoodGames", does_repairs: false, stock_limit: 5)
    @game1 = @shop1.video_games.create!(name: "DOOM 2016", rating: "M", price: 70, multiplayer: false)
    @game2 = @shop1.video_games.create!(name: "FIFA 2020", rating: "E", price: 55, multiplayer: true)
    @game3 = @shop2.video_games.create!(name: "Elden Ring", rating: "M", price: 65, multiplayer: true)

    visit "/game_shops"
  end

  context 'a show page should have a delete link' do
    it "delete Fred's games from the show page" do
      expect(page).to have_content("Fred's Games")

      visit "/game_shops/#{@shop1.id}"
      click_link "Delete Fred's Games"

      expect(current_path).to eq("/game_shops")
      expect(page).to_not have_content("Fred's Games")
    end
  end

  context 'each game shop should have a delete link' do
    it "delete Fred's Games" do
      expect(page).to have_content("Fred's Games")

      within "#game-shop-#{@shop1.id}" do
        click_link "Delete Fred's Games"
      end

      expect(current_path).to eq('/game_shops')
      expect(page).to_not have_content("Fred's Games")
    end

    it 'delete Gameville' do
      expect(page).to have_content("Gameville")

      within "#game-shop-#{@shop2.id}" do
        click_link "Delete Gameville"
      end

      expect(current_path).to eq("/game_shops")
      expect(page).to_not have_content("Gameville")
    end

    it 'delete GoodGames' do
      expect(page).to have_content("GoodGames")

      within "#game-shop-#{@shop3.id}" do
        click_link "Delete GoodGames"
      end

      expect(current_path).to eq("/game_shops")
      expect(page).to_not have_content("GoodGames")
    end

    it 'all stocked video games are deleted after deleting a game shop' do
      click_link "Delete Fred's Games"

      visit "/video_games"

      expect(page).to_not have_content(@game1.name)
      expect(page).to_not have_content(@game2.name)
    end
  end

end
