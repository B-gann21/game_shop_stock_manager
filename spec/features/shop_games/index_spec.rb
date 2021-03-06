require 'rails_helper'

RSpec.describe 'ShopGames' do
  before :each do
    VideoGame.destroy_all
    GameShop.destroy_all

    @shop1 = GameShop.create!(name: "Fred's Games", does_repairs: false, stock_limit: 3)
    @shop2 = GameShop.create!(name: "Gameville", does_repairs: false, stock_limit: 5)
    @game1 = @shop1.video_games.create!(name: "DOOM 2016", rating: "M", price: 70, multiplayer: false)
    @game2 = @shop1.video_games.create!(name: "FIFA 2020", rating: "E", price: 55, multiplayer: true)
    @game3 = @shop2.video_games.create!(name: "Elden Ring", rating: "M", price: 65, multiplayer: true)
    @game4 = @shop1.video_games.create!(name: "Elephant Simulator", rating: "M 17+", price: 100, multiplayer: true)

    visit "/game_shops/#{@shop1.id}/video_games"
  end

  context '#index' do
    it 'displays all VideoGames that have a matching shop_id' do
      expect(page).to have_content(@game1.name)

      expect(page).to have_content(@game2.name)

      expect(page).to_not have_content(@game3.name)
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
    end
  end

  context 'sorting the games' do
    it 'should have a button to alphabetize the games' do
      click_link "Sort Alphabetically"

      expect(current_path).to eq("/game_shops/#{@shop1.id}/video_games")

      expect("DOOM 2016").to appear_before("Elephant Simulator")
      expect("Elephant Simulator").to appear_before("FIFA 2020")
    end

    it 'should have a form to only show games over a given price' do
      expect(page).to have_content("DOOM 2016")
      expect(page).to have_content("FIFA 2020")
      expect(page).to have_content("Elephant Simulator")

      fill_in :quantity, with: 55
      click_button "Filter"

      expect(current_path).to eq("/game_shops/#{@shop1.id}/video_games")
      expect(page).to have_content("DOOM 2016")
      expect(page).to_not have_content("FIFA 2020")
      expect(page).to have_content("Elephant Simulator")
    end
  end

  context 'index links' do
    it 'displays a link to the VideoGame index' do
      expect(page).to have_link('Video Game Index')

      click_link('Video Game Index')

      expect(page).to_not have_content(@game1.name)
      expect(page).to have_content(@game2.name)
      expect(page).to have_content(@game3.name)
    end

    it 'displays a link to the GameShop index' do
      expect(page).to have_link('Game Shop Index')

      click_link('Game Shop Index')

      expect(page).to have_content(@shop1.name)
      expect(page).to have_content(@shop2.name)
    end

    it 'should display links at the bottom of the page' do
      expect("Video Game Index").to_not appear_before("Games from shop #")

      expect("Game Shop Index").to_not appear_before("Games from shop #")
    end
  end

  context 'show links' do
    it "has each game's name as a link" do
      expect(page).to have_link("DOOM 2016")
      expect(page).to have_link("FIFA 2020")
    end

    it "clicking DOOM 2016 brings you to it's show page" do
      click_link('DOOM 2016')

      expect(current_path).to eq("/video_games/#{@game1.id}")
    end

    it "clicking on FIFA 2020 takes you to it's show page" do
      click_link('FIFA 2020')

      expect(current_path).to eq("/video_games/#{@game2.id}")
    end
  end
end
