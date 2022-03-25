require 'rails_helper'

RSpec.describe 'VideoGames', type: :feature do
  before :each do
    @shop1 = GameShop.create!(name: "Fred's Games", does_repairs: false, stock_limit: 3)
    @game1 = @shop1.video_games.create!(name: "DOOM 2016", rating: "M", price: 70, multiplayer: false)
    @game2 = @shop1.video_games.create!(name: "FIFA 2020", rating: "E", price: 55, multiplayer: true)
    @game3 = @shop1.video_games.create!(name: "Elden Ring", rating: "M", price: 65, multiplayer: true)

    visit "/video_games/#{@game1.id}"
  end

  context 'links' do
    it 'displays a link to the video_game_index' do
      expect(page).to have_link('Video Game Index')

      click_link('Video Game Index')

      expect(page).to have_content(@game1.name)
      expect(page).to have_content(@game2.name)
      expect(page).to have_content(@game3.name)
    end

    it 'should display links at the top of the page' do
      expect(page.text.index("Video Game Index")).to eq(0)
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
