require 'rails_helper'

RSpec.describe 'VideoGames#edit' do
  before :each do
    VideoGame.destroy_all
    GameShop.destroy_all

    @shop1 = GameShop.create!(name: "Fred's Games", does_repairs: false, stock_limit: 3)
    @game1 = @shop1.video_games.create!(name: "DOOM 2016", rating: "M", price: 70, multiplayer: false)
    @game2 = @shop1.video_games.create!(name: "FIFA 2020", rating: "E", price: 55, multiplayer: true)
    @game3 = @shop1.video_games.create!(name: "Elden Ring", rating: "M", price: 65, multiplayer: true)

    visit "/video_games/#{@game1.id}"
  end

  context 'functionality of Edit link' do
    it 'should have an Edit Game link' do
      expect(page).to have_link("Edit DOOM 2016")
    end

    it 'clicking Edit Game takes you to edit page' do
      click_link 'Edit DOOM 2016'

      expect(current_path).to eq("/video_games/#{@game1.id}/edit")
    end
  end

  context 'updating a Video Game' do
    it 'submitting the form will change the attributes' do
      click_link 'Edit DOOM 2016'

      fill_in :name, with: "The Legend of Zelda"
      fill_in :rating, with: "T"
      fill_in :price, with: 60
      uncheck :multiplayer

      click_button "Update Game"

      expect(current_path).to eq("/video_games/#{@game1.id}")
      expect(page).to have_content("The Legend of Zelda")
    end
  end

  context 'updating from index page' do
    it 'FIFA 2020 should have an update link nearby' do
      visit '/video_games'

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
      visit '/video_games'

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

  context 'Shop Games index page should have edit links' do
    it 'DOOM 2016 should have an update link nearby' do
      visit "/game_shops/#{@shop1.id}/video_games"

      within "#video-game-#{@game1.id}" do
        click_link "Edit DOOM 2016"

        expect(current_path).to eq("/video_games/#{@game1.id}/edit")
      end

      fill_in :name, with: "DOOM Eternal"
      fill_in :rating, with: "M"
      fill_in :price, with: 50
      check :multiplayer
      click_button "Update Game"

      expect(current_path).to eq("/video_games/#{@game1.id}")

      expect(page).to have_content("DOOM Eternal")
      expect(page).to have_content("Rating: M")
      expect(page).to have_content("Price: 50")
      expect(page).to have_content("Multiplayer: true")

      expect(page).to_not have_content("DOOM 2016")
      expect(page).to_not have_content("Price: 70")
    end

    it 'FIFA 2020 should have an update link nearby' do
      visit "/game_shops/#{@shop1.id}/video_games"

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
  end
end
