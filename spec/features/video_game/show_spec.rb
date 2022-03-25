require 'rails_helper'

RSpec.describe 'VideoGames' do
  before :each do
    @shop1 = GameShop.create!(name: "Fred's Games", does_repairs: false, stock_limit: 3)
    @shop2 = GameShop.create!(name: "Gameville", does_repairs: false, stock_limit: 5)
    @shop3 = GameShop.create!(name: "GoodGames", does_repairs: false, stock_limit: 5)
    @game1 = @shop1.video_games.create!(name: "DOOM 2016", rating: "M", price: 70, multiplayer: false)
    @game2 = @shop1.video_games.create!(name: "FIFA 2020", rating: "E", price: 55, multiplayer: true)
    @game3 = @shop1.video_games.create!(name: "Elden Ring", rating: "M", price: 65, multiplayer: true)

    visit "/video_games/#{@game1.id}"
  end

  context 'links' do
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
      expect("Video Game Index").to appear_before("#{@game1.name}")

      expect("Game Shop Index").to appear_before("#{@game1.name}")
    end
  end

  context '#show' do
    it 'displays the matching VideoGame and attributes' do
      expect(page).to have_content("ID: #{@game1.id}")
      expect(page).to have_content(@game1.name)
      expect(page).to have_content("Rating: #{@game1.rating}")
      expect(page).to have_content("Price: #{@game1.price}")
      expect(page).to have_content("Multiplayer: #{@game1.multiplayer}")
      expect(page).to have_content("Created at: #{@game1.created_at}")
      expect(page).to have_content("Updated at: #{@game1.updated_at}")

      expect(page).to_not have_content("ID: #{@game2.id}")
      expect(page).to_not have_content(@game2.name)
      expect(page).to_not have_content("Rating: #{@game2.rating}")
      expect(page).to_not have_content("Price: #{@game2.price}")
      expect(page).to_not have_content("Multiplayer: true")
    end
  end
end
