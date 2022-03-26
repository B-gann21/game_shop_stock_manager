require 'rails_helper'
RSpec.describe 'GameShops#index' do
  before :each do
    @shop1 = GameShop.create!(name: "Fred's Games", does_repairs: false, stock_limit: 3)
    @shop2 = GameShop.create!(name: "Gameville", does_repairs: false, stock_limit: 5)
    @shop3 = GameShop.create!(name: "GoodGames", does_repairs: false, stock_limit: 5)
    @game1 = @shop1.video_games.create!(name: "DOOM 2016", rating: "M", price: 70, multiplayer: false)
    @game2 = @shop1.video_games.create!(name: "FIFA 2020", rating: "E", price: 55, multiplayer: true)
    @game3 = @shop2.video_games.create!(name: "Elden Ring", rating: "M", price: 65, multiplayer: true)

    visit '/game_shops/'
  end

  context 'index links' do
    it 'displays a link to the VideoGame index' do
      expect(page).to have_link('Video Game Index')

      click_link('Video Game Index')

      expect(page).to have_content(@game1.name)
      expect(page).to have_content(@game2.name)
      expect(page).to have_content(@game3.name)
    end

    it 'displays a link to the GameShop index' do
      expect(page).to have_link('Game Shop Index')

      click_link('Game Shop Index')

      expect(page).to have_content(@shop1.name)
      expect(page).to have_content(@shop2.name)
      expect(page).to have_content(@shop3.name)
    end

    it 'should display links at the top of the page' do
      expect("Video Game Index").to appear_before("Game Shop Index")
      expect("Video Game Index").to appear_before("All Game Shops")

      expect("Game Shop Index").to appear_before("All Game Shops")
    end
  end

  context 'show links' do
    it 'has the name of each GameShop as a link to its show page' do
      expect(page).to have_link("Fred's Games")
      expect(page).to have_link("Gameville")
      expect(page).to have_link("GoodGames")
    end

    it "clicking on Fred's Games brings you to it's show page" do
      click_link("Fred's Games")

      expect(current_path).to eq("/game_shops/#{@shop1.id}")
      expect(page).to have_content("Fred's Games")
    end

    it "clicking on GameVille takes you to it's show page" do
      click_link("Gameville")

      expect(current_path).to eq("/game_shops/#{@shop2.id}")
      expect(page).to have_content("Gameville")
    end

    it "clicking on GoodGames takes you to it's show page" do
      click_link("GoodGames")

      expect(current_path).to eq("/game_shops/#{@shop3.id}")
      expect(page).to have_content("GoodGames")
    end
  end
end
