require 'rails_helper'

RSpec.describe 'GameShops', type: :feature do

  context '#index' do
    before :each do
      @shop1 = GameShop.create!(name: "Fred's Games", does_repairs: false, stock_limit: 3)
      @shop2 = GameShop.create!(name: "Gameville", does_repairs: false, stock_limit: 5)
      @shop3 = GameShop.create!(name: "GoodGames", does_repairs: false, stock_limit: 5)
      @game1 = @shop1.video_games.create!(name: "DOOM 2016", rating: "M", price: 70, multiplayer: false)
      @game2 = @shop1.video_games.create!(name: "FIFA 2020", rating: "E", price: 55, multiplayer: true)
      @game3 = @shop2.video_games.create!(name: "Elden Ring", rating: "M", price: 65, multiplayer: true)

      visit '/game_shops'
    end

    it 'displays a link to the video_game_index' do
      expect(page).to have_link('Video Game Index')

      click_link('Video Game Index')

      expect(page).to have_content(@game1.name)
      expect(page).to have_content(@game2.name)
      expect(page).to have_content(@game3.name)
    end

    it 'displays all names' do
      expect(page).to have_content(@shop1.name)
      expect(page).to have_content(@shop2.name)
    end

    it 'displays in order of created_at attribute' do
      expect("#{@shop1.name}").to appear_before("#{@shop2.name}")
      expect("#{@shop1.name}").to appear_before("#{@shop3.name}")

      expect("#{@shop2.name}").to_not appear_before("#{@shop1.name}")
      expect("#{@shop2.name}").to appear_before("#{@shop3.name}")

      expect("#{@shop3.name}").to_not appear_before("#{@shop1.name}")
      expect("#{@shop3.name}").to_not appear_before("#{@shop2.name}")
    end

    it 'displays created_at attributes next to the names' do
      expect(page).to have_content("#{@shop1.name} -- Created: #{@shop1.created_at}")
      expect(page).to have_content("#{@shop2.name} -- Created: #{@shop2.created_at}")
      expect(page).to have_content("#{@shop3.name} -- Created: #{@shop3.created_at}")
    end
  end
end
