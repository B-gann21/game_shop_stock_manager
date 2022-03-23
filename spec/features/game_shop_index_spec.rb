require 'rails_helper'

RSpec.describe 'GameShop index', type: :feature do
  describe '/game_shops' do
    it 'displays all GameShop names' do
      shop1 = GameShop.create(name: "Fred's Games", overstocked: false, stock_limit: 3)
      shop2 = GameShop.create(name: "Gameville", overstocked: false, stock_limit: 3)
      
      visit '/game_shops'

      expect(page).to have_content(shop1.name)
      expect(page).to have_content(shop2.name)
    end
  end
end
