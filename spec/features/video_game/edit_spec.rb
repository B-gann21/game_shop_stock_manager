# As a visitor
# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information

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
end
