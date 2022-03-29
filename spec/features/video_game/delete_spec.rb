require 'rails_helper'

# As a visitor
# When I visit a child show page
# Then I see a link to delete the child "Delete Child"
# When I click the link
# Then a 'DELETE' request is sent to '/child_table_name/:id',
# the child is deleted,
# and I am redirected to the child index page where I no longer see this child

RSpec.describe 'VideoGames#delete' do
  before :each do
    VideoGame.destroy_all
    GameShop.destroy_all

    @shop1 = GameShop.create!(name: "Fred's Games", does_repairs: false, stock_limit: 3)
    @shop2 = GameShop.create!(name: "Gameville", does_repairs: false, stock_limit: 5)
    @shop3 = GameShop.create!(name: "GoodGames", does_repairs: false, stock_limit: 5)
    @game1 = @shop1.video_games.create!(name: "DOOM 2016", rating: "M", price: 70, multiplayer: true)
    @game2 = @shop1.video_games.create!(name: "FIFA 2020", rating: "E", price: 55, multiplayer: true)
    @game3 = @shop2.video_games.create!(name: "Elden Ring", rating: "M", price: 65, multiplayer: true)

    visit '/video_games'
  end

  context 'VideoGames#show page should have a delete link' do
    it 'deleting DOOM 2016 from show page' do
      expect(page).to have_content("DOOM 2016")

      visit "/video_games/#{@game1.id}"

      click_link "Delete DOOM 2016"

      expect(current_path).to eq("/video_games")
      expect(page).to_not have_content("DOOM 2016")
    end
  end

  context "VideoGames#index page should have a delete link near each game" do
    it 'deleting DOOM 2016' do
      expect(page).to have_content("DOOM 2016")

      within "#video-game-#{@game1.id}" do
        click_link "Delete DOOM 2016"
      end

      expect(current_path).to eq("/video_games")
      expect(page).to_not have_content("DOOM 2016")
    end

    it 'deleting FIFA 2020' do
      expect(page).to have_content("FIFA 2020")

      within "#video-game-#{@game2.id}" do
        click_link "Delete FIFA 2020"
      end

      expect(current_path).to eq("/video_games")
      expect(page).to_not have_content("FIFA 2020")
    end

    it 'deleting Elden Ring' do
      expect(page).to have_content("Elden Ring")

      within "#video-game#{@game3.id}" do
        click_link "Delete Elden Ring"
      end
      
      expect(current_path).to eq("/video_games")
      expect(page).to_not have_content("Elden Ring")
    end
  end
end
