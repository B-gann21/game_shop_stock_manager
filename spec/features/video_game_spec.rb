require 'rails_helper'

RSpec.describe 'VideoGame' do
before :each do
  @shop1 = GameShop.create!(name: "Fred's Games", overstocked: false, stock_limit: 3)
  @game1 = @shop1.video_games.create!(name: "DOOM 2016", rating: "M", price: 70, multiplayer: false)
  @game2 = @shop1.video_games.create!(name: "FIFA 2020", rating: "E", price: 55, multiplayer: true)
  @game3 = @shop1.video_games.create!(name: "Elden Ring", rating: "M", price: 65, multiplayer: true)
end

  context '/video_games' do
    it 'displays all VideoGame names' do
      visit '/video_games'

      expect(page).to have_content(@game1.name)
      expect(page).to have_content(@game2.name)
      expect(page).to have_content(@game3.name)
    end
  end

  context '/video_games/:id' do
    it 'displays the matching VideoGame and attributes' do
      shop1 = GameShop.create!(name: "Fred's Games", overstocked: false, stock_limit: 3)
      game1 = @shop1.video_games.create!(name: "DOOM 2016", rating: "M", price: 70, multiplayer: false)
      game2 = @shop1.video_games.create!(name: "FIFA 2020", rating: "E", price: 55, multiplayer: true)
      game3 = @shop1.video_games.create!(name: "Elden Ring", rating: "M", price: 65, multiplayer: false)

      visit "/video_games/#{@game1.id}"

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
