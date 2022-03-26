require 'rails_helper'

RSpec.describe 'VideoGames#index' do
  before :each do
    @shop1 = GameShop.create!(name: "Fred's Games", does_repairs: false, stock_limit: 3)
    @shop2 = GameShop.create!(name: "Gameville", does_repairs: false, stock_limit: 5)
    @shop3 = GameShop.create!(name: "GoodGames", does_repairs: false, stock_limit: 5)
    @game1 = @shop1.video_games.create!(name: "DOOM 2016", rating: "M", price: 70, multiplayer: false)
    @game2 = @shop1.video_games.create!(name: "FIFA 2020", rating: "E", price: 55, multiplayer: true)
    @game3 = @shop1.video_games.create!(name: "Elden Ring", rating: "M", price: 65, multiplayer: true)

    visit '/video_games'
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
      expect("Video Game Index").to appear_before("All Video Games")

      expect("Game Shop Index").to appear_before("All Video Games")
    end
  end

  context "show links" do
    it "has each game's name as a link" do
      expect(page).to have_link("DOOM 2016")
      expect(page).to have_link("FIFA 2020")
      expect(page).to have_link("Elden Ring")
    end

    it "clicking on DOOM 2016 brings you to it's show page" do
      click_link("DOOM 2016")

      expect(current_path).to eq("/video_games/#{@game1.id}")
    end

    it "clicking on FIFA 2020 brings you to it's show page" do
      click_link("FIFA 2020")

      expect(current_path).to eq("/video_games/#{@game2.id}")
    end

    it "clicking on Elden Ring brings you to it's show page" do
      click_link('Elden Ring')

      expect(current_path).to eq("/video_games/#{@game3.id}")
    end
  end
end
