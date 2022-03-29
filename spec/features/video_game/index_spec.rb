require 'rails_helper'

RSpec.describe 'VideoGames' do
  before :each do
    VideoGame.destroy_all
    GameShop.destroy_all

    @shop1 = GameShop.create!(name: "Fred's Games", does_repairs: false, stock_limit: 3)
    @shop2 = GameShop.create!(name: "Gameville", does_repairs: false, stock_limit: 5)
    @shop3 = GameShop.create!(name: "GoodGames", does_repairs: false, stock_limit: 5)
    @game1 = @shop1.video_games.create!(name: "DOOM 2016", rating: "M", price: 70, multiplayer: false)
    @game2 = @shop1.video_games.create!(name: "FIFA 2020", rating: "E", price: 55, multiplayer: true)
    @game3 = @shop1.video_games.create!(name: "Elden Ring", rating: "M", price: 65, multiplayer: true)

    visit '/video_games'
  end

  context '#index' do
    it 'displays only VideoGames that have multiplayer: true' do
      expect(page).to_not have_content(@game1.name)

      expect(page).to have_content(@game2.name)

      expect(page).to have_content(@game3.name)
    end

    it 'displays attributes next to their VideoGame' do
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
      expect(page).to have_content(@shop3.name)
    end

    it 'should display links at the bottom of the page' do
      expect("Video Game Index").to_not appear_before("All Video Games")
      expect("Video Game Index").to_not appear_before(@game2.name)
      expect("Video Game Index").to_not appear_before(@game3.name)

      expect("Game Shop Index").to_not appear_before("All Video Games")
      expect("Game Shop Index").to_not appear_before(@game2.name)
      expect("Game Shop Index").to_not appear_before(@game3.name)
    end
  end

  context "show links" do
    it "has each game's name as a link" do
      expect(page).to have_link("FIFA 2020")
      expect(page).to have_link("Elden Ring")
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

  context 'update links' do
    it 'FIFA 2020 should have an update link nearby' do
      within "#video-game-#{@game2.id}" do
        click_link "Edit FIFA 2020"

        expect(current_path).to eq("/video_games/#{@game2.id}/edit")
      end

      fill_in :name, with: "FIFA 2021"
      fill_in :rating, with: "T"
      fill_in :price, with: 60
      check :multiplayer
      click_button "Update Game"

      expect(current_path).to eq("/video_games/#{@game2.id}")

      expect(page).to have_content("FIFA 2021")
      expect(page).to have_content("Rating: T")
      expect(page).to have_content("Price: 60")
      expect(page).to have_content("Multiplayer: true")

      expect(page).to_not have_content("FIFA 2020")
      expect(page).to_not have_content("Rating: E")
      expect(page).to_not have_content("Price: 55")
    end

    it 'Elden Ring should have an update link nearby' do
      within "#video-game-#{@game3.id}" do
        click_link "Edit Elden Ring"

        expect(current_path).to eq("/video_games/#{@game3.id}/edit")
      end

      fill_in :name, with: "Elden-Ring"
      fill_in :rating, with: "T"
      fill_in :price, with: 60
      uncheck :multiplayer
      click_button "Update Game"

      expect(current_path).to eq("/video_games/#{@game3.id}")

      expect(page).to have_content("Elden-Ring")
      expect(page).to have_content("Rating: T")
      expect(page).to have_content("Price: 60")
      expect(page).to have_content("Multiplayer: false")

      expect(page).to_not have_content("Elden Ring")
      expect(page).to_not have_content("Rating: M")
      expect(page).to_not have_content("Price: 65")
    end
  end
end
