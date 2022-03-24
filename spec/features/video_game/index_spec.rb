require 'rails_helper'

RSpec.describe 'VideoGames#index', type: :feature do
  context '/video_games' do
    it 'displays all VideoGame names' do
      shop1 = GameShop.create!(name: "Fred's Games", overstocked: false, stock_limit: 3)
      game1 = shop1.video_games.create!(name: "DOOM 2016", rating: "M", price: 70, multiplayer: false)
      game2 = shop1.video_games.create!(name: "FIFA 2020", rating: "E", price: 55, multiplayer: true)
      game3 = shop1.video_games.create!(name: "Elden Ring", rating: "M", price: 65, multiplayer: true)

      visit '/video_games'

      expect(page).to have_content(game1.name)
      expect(page).to have_content(game2.name)
      expect(page).to have_content(game3.name)
    end
  end
end
