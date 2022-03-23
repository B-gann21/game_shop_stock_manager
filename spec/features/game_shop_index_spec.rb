require 'rails_helper'

RSpec.describe 'GameShop index', type: :feature do
  context '/game_shops' do
    before :each do
      # User Story 1, Parent Index
      #
      # For each parent table
      # As a visitor
      # When I visit '/parents'
      # Then I see the name of each parent record in the system
      shop1 = GameShop.create(name: "Fred's Games", overstocked: false, potential_revenue: 0)
      shop2 = GameShop.create(name: "Gameville", overstocked: false, potential_revenue: 0)

      visit '/game_shops'

      expect(page).to have_content(shop1.name)
      expect(page).to have_content(shop2.name)
    end
  end
end
