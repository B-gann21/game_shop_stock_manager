require 'rails_helper'

RSpec.describe 'GameShops', type: :feature do

  context '#index' do
    before :each do
      @shop1 = GameShop.create!(name: "Fred's Games", does_repairs: false, stock_limit: 3)
      @shop2 = GameShop.create!(name: "Gameville", does_repairs: false, stock_limit: 5)
      @shop3 = GameShop.create!(name: "GoodGames", does_repairs: false, stock_limit: 5)
    end

    it 'displays all names' do
      visit '/game_shops'

      expect(page).to have_content(@shop1.name)
      expect(page).to have_content(@shop2.name)
    end

    it 'displays in order of created_at attribute' do
      visit '/game_shops'
      content = page.text
      shop1_position = content.index("#{@shop1.name}")
      shop2_position = content.index("#{@shop2.name}")
      shop3_position = content.index("#{@shop3.name}")

      expect(shop1_position).to be < shop2_position
      expect(shop1_position).to be < shop3_position

      expect(shop2_position).to be < shop3_position
      expect(shop2_position).to be > shop1_position

      expect(shop3_position).to be > shop1_position
      expect(shop3_position).to be > shop2_position
    end

    it 'displays created_at attributes next to the names' do
      visit '/game_shops'

      expect(page).to have_content("#{@shop1.name} -- Created: #{@shop1.created_at}")
      expect(page).to have_content("#{@shop2.name} -- Created: #{@shop2.created_at}")
      expect(page).to have_content("#{@shop3.name} -- Created: #{@shop3.created_at}")
    end
  end
end
