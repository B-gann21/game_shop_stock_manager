require 'rails_helper'

RSpec.describe 'ShopGames#index', type: :feature do
  context '/game_shops/:id/video_games' do
    # As a visitor
    # When I visit '/parents/:parent_id/child_table_name'
    # Then I see each Child that is associated with that Parent with each Child's attributes:
    it 'displays all VideoGames that have a matching shop_id' do
      shop1 = GameShop.create!(name: "Fred's Games", does_repairs: false, stock_limit: 3)
      shop2 = GameShop.create!(name: "Gameville", does_repairs: false, stock_limit: 5)
      game1 = shop1.video_games.create!(name: "DOOM 2016", rating: "M", price: 70, multiplayer: false)
      game2 = shop1.video_games.create!(name: "FIFA 2020", rating: "E", price: 55, multiplayer: true)
      game3 = shop2.video_games.create!(name: "Elden Ring", rating: "M", price: 65, multiplayer: true)

      visit "/game_shops/#{shop1.id}/video_games"

      expect(page).to have_content("ID: #{game1.id}")
      expect(page).to have_content(game1.name)
      expect(page).to have_content("Rating: #{game1.rating}")
      expect(page).to have_content("Price: #{game1.price}")
      expect(page).to have_content("Multiplayer: #{game1.multiplayer}")
      expect(page).to have_content("Created at: #{game1.created_at}")
      expect(page).to have_content("Updated at: #{game1.updated_at}")

      expect(page).to have_content("ID: #{game2.id}")
      expect(page).to have_content(game2.name)
      expect(page).to have_content("Rating: #{game2.rating}")
      expect(page).to have_content("Price: #{game2.price}")
      expect(page).to have_content("Multiplayer: #{game2.multiplayer}")
      expect(page).to have_content("Created at: #{game2.created_at}")
      expect(page).to have_content("Updated at: #{game2.updated_at}")

      expect(page).to_not have_content("ID: #{game3.id}")
      expect(page).to_not have_content(game3.name)
      expect(page).to_not have_content("Price: #{game3.price}")
    end
  end
end
