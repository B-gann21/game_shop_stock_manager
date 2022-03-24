require 'rails_helper'

RSpec.describe 'GameShops', type: :feature do

  context '#index' do
    it 'displays all GameShop names' do
      shop1 = GameShop.create!(name: "Fred's Games", does_repairs: false, stock_limit: 3)
      shop2 = GameShop.create!(name: "Gameville", does_repairs: false, stock_limit: 5)

      visit '/game_shops'

      expect(page).to have_content(shop1.name)
      expect(page).to have_content(shop2.name)
    end
  end
end
