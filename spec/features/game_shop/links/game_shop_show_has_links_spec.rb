require 'rails_helper'

RSpec.describe "GameShops#show" do
  before :each do
    @shop1 = GameShop.create!(name: "Fred's Games", does_repairs: false, stock_limit: 3)
    @shop2 = GameShop.create!(name: "Gameville", does_repairs: false, stock_limit: 5)
    @game1 = @shop1.video_games.create!(name: "DOOM 2016", rating: "M", price: 70, multiplayer: false)
    @game2 = @shop1.video_games.create!(name: "FIFA 2020", rating: "E", price: 55, multiplayer: true)
    @game3 = @shop2.video_games.create!(name: "Elden Ring", rating: "M", price: 65, multiplayer: true)

    visit "/game_shops/#{@shop1.id}"
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
    end

    it 'displays a link for all related games' do
      expect(page).to have_link("Games sold by #{@shop1.name}")

      click_link("Games sold by #{@shop1.name}")

      expect(page).to have_content(@game1.name)
      expect(page).to have_content(@game2.name)
      expect(page).to_not have_content(@game3.name)
    end

    it 'should display index links at the top of the page' do
      expect("Video Game Index").to appear_before("Game Shop Index")
      expect("Video Game Index").to appear_before(@shop1.name)

      expect("Game Shop Index").to appear_before(@shop1.name)
    end
  end
end
