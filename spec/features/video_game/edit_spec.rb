require 'rails_helper'

RSpec.describe 'VideoGames#edit' do
  before :each do
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
end