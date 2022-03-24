require 'rails_helper'

RSpec.describe 'GameShops#show', type: :feature do
  context '/game_shops/:id' do
    it 'displays the matching GameShop and attibutes' do
      shop1 = GameShop.create!(name: "Fred's Games", overstocked: false, stock_limit: 3)
      shop2 = GameShop.create!(name: "Gameville", overstocked: false, stock_limit: 5)

      visit "/game_shops/#{shop1.id}"

      expect(page).to have_content("ID: #{shop1.id}")
      expect(page).to have_content(shop1.name)
      expect(page).to have_content("Overstocked: #{shop1.overstocked}")
      expect(page).to have_content("Stock limit: #{shop1.stock_limit}")
      expect(page).to have_content("Created at: #{shop1.created_at}")
      expect(page).to have_content("Updated at: #{shop1.updated_at}")

      expect(page).to_not have_content("ID: #{shop2.id}")
      expect(page).to_not have_content(shop2.name)
      expect(page).to_not have_content("Stock limit: #{shop2.stock_limit}")
    end
  end
end