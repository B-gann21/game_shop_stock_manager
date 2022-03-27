require 'rails_helper'

RSpec.describe "ShopGames#new" do
  before :each do
    @shop1 = GameShop.create!(name: "Fred's Games", does_repairs: false, stock_limit: 3)
    @shop2 = GameShop.create!(name: "Gameville", does_repairs: false, stock_limit: 5)
    @game1 = @shop1.video_games.create!(name: "DOOM 2016", rating: "M", price: 70, multiplayer: false)
    @game2 = @shop1.video_games.create!(name: "FIFA 2020", rating: "E", price: 55, multiplayer: true)
    @game3 = @shop2.video_games.create!(name: "Elden Ring", rating: "M", price: 65, multiplayer: true)

    visit "/game_shops/#{@shop1.id}/video_games"
  end
  # As a visitor
  # When I visit a Parent Childs Index page
  # Then I see a link to add a new adoptable child for that parent "Create Child"
  # When I click the link
  # I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
  # When I fill in the form with the child's attributes:
  # And I click the button "Create Child"
  # Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
  # a new child object/row is created for that parent,
  # and I am redirected to the Parent Childs Index page where I can see the new child listed
  context 'functionality of ShopGames#new link' do
    it 'ShopGames#index page should have a link to create a new video game' do
      expect(page).to have_link("Add to stock")
    end

    it 'Add to stock should take you to the new Video Game page' do
      click_link("Add to stock")

      expect(current_path).to eq("/game_shops/#{@shop1.id}/video_games/new")
    end
  end
end
