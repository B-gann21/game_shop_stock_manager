require 'rails_helper'

RSpec.describe 'GameShop', type: :feature do
  before :each do
    @shop1 = GameShop.create!(name: "Fred's Games", overstocked: false, stock_limit: 3)
    @shop2 = GameShop.create!(name: "Gameville", overstocked: false, stock_limit: 5)
  end

  context '/game_shops' do
    it 'displays all GameShop names' do
      visit '/game_shops'

      expect(page).to have_content(@shop1.name)
      expect(page).to have_content(@shop2.name)
    end
  end

  context '/game_shops/:id' do
    it 'displays the matching GameShop and attibutes' do
      visit "/game_shops/#{@shop1.id}"

      expect(page).to have_content("ID: #{@shop1.id}")
      expect(page).to have_content(@shop1.name)
      expect(page).to have_content("Overstocked: #{@shop1.overstocked}")
      expect(page).to have_content("Stock limit: #{@shop1.stock_limit}")
      expect(page).to have_content("Created at: #{@shop1.created_at}")
      expect(page).to have_content("Updated at: #{@shop1.updated_at}")

      expect(page).to_not have_content("ID: #{@shop2.id}")
      expect(page).to_not have_content(@shop2.name)
      expect(page).to_not have_content("Stock limit: #{@shop2.stock_limit}")
    end
  end

  context '/game_shops/:id/video_games' do
    # As a visitor
    # When I visit '/parents/:parent_id/child_table_name'
    # Then I see each Child that is associated with that Parent with each Child's attributes:
  end
end
