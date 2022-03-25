require 'rails_helper'

RSpec.describe 'GameShops', type: :feature do
  before :each do
    @shop1 = GameShop.create!(name: "Fred's Games", does_repairs: false, stock_limit: 3)
    @shop2 = GameShop.create!(name: "Gameville", does_repairs: false, stock_limit: 5)
    @game1 = @shop1.video_games.create!(name: "DOOM 2016", rating: "M", price: 70, multiplayer: false)
    @game2 = @shop1.video_games.create!(name: "FIFA 2020", rating: "E", price: 55, multiplayer: true)
    @game3 = @shop2.video_games.create!(name: "Elden Ring", rating: "M", price: 65, multiplayer: true)
  end

  context '#show' do
    it 'displays a link to the video_game_index' do
      expect(page).to have_link('Video Game Index')

      click_link('Video Game Index')

      expect(page).to have_content(@game1.name)
      expect(page).to have_content(@game2.name)
      expect(page).to have_content(@game3.name)
    end
    
    it 'displays the matching GameShop and attibutes' do
      visit "/game_shops/#{@shop1.id}"

      expect(page).to have_content("ID: #{@shop1.id}")
      expect(page).to have_content(@shop1.name)
      expect(page).to have_content("Does repairs: #{@shop1.does_repairs}")
      expect(page).to have_content("Stock limit: #{@shop1.stock_limit}")
      expect(page).to have_content("Created at: #{@shop1.created_at}")
      expect(page).to have_content("Updated at: #{@shop1.updated_at}")
      expect(page).to have_content("Games sold: 2")

      expect(page).to_not have_content("ID: #{@shop2.id}")
      expect(page).to_not have_content(@shop2.name)
      expect(page).to_not have_content("Stock limit: #{@shop2.stock_limit}")
    end

  end
end
