require 'rails_helper'

RSpec.describe "GameShop#edit" do
  before :each do
    @shop1 = GameShop.create!(name: "Fred's Games", does_repairs: false, stock_limit: 3)
    visit "/game_shops/#{@shop1.id}"
  end

  context 'Edit link functionality' do
    it 'should have a link to edit the Game Shop' do
      expect(page).to have_link("Edit Fred's Games")
    end

    it 'clicking the link should bring you to the edit page' do
      click_link "Edit Fred's Games"

      expect(current_path).to eq("/game_shops/#{@shop1.id}/edit")
    end
  end

  context 'editing a Game Shop' do
    it 'after submitting the form, you can see the new attributes' do
      click_link "Edit Fred's Games"

      fill_in :name, with: "Fred's Game Shop"
      fill_in :does_repairs, with: "true"
      fill_in :stock_limit, with: 9
      click_button "Update Game Shop"
      expect(current_path).to eq("/game_shops/#{@shop1.id}")
      expect(page).to have_content("Fred's Game Shop")
      expect(page).to have_content("Does repairs: true")
      expect(page).to have_content("Stock limit: 9")
    end
  end
end
