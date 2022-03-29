require 'rails_helper'

RSpec.describe "GameShop#edit" do
  before :each do
    VideoGame.destroy_all
    GameShop.destroy_all

    @shop1 = GameShop.create!(name: "Fred's Games", does_repairs: false, stock_limit: 3)
    @shop2 = GameShop.create!(name: "Gameville", does_repairs: false, stock_limit: 5)

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
      check :does_repairs
      fill_in :stock_limit, with: 9
      click_button "Update Game Shop"
      expect(current_path).to eq("/game_shops/#{@shop1.id}")
      expect(page).to have_content("Fred's Game Shop")
      expect(page).to have_content("Does repairs: true")
      expect(page).to have_content("Stock limit: 9")
    end
  end

  context "each game shop should have an update link near it's name" do
    it "update Fred's games" do
      visit '/game_shops'

      within "#game-shop-#{@shop1.id}" do
        click_link "Edit Fred's Games"

        expect(current_path).to eq("/game_shops/#{@shop1.id}/edit")
      end

      fill_in :name, with: "Fred's Video Games"
      check :does_repairs
      fill_in :stock_limit, with: 10
      click_button "Update Game Shop"

      expect(current_path).to eq("/game_shops/#{@shop1.id}")
      expect(page).to have_content("Fred's Video Games")
      expect(page).to have_content("Does repairs: true")
      expect(page).to have_content("Stock limit: 10")

      expect(page).to_not have_content("Fred's Games")
      expect(page).to_not have_content("Does repairs: false")
      expect(page).to_not have_content("Stock limit: 3")
    end

    it "update GameVille" do
      visit '/game_shops'

      within "#game-shop-#{@shop2.id}" do
        click_link "Edit Gameville"

        expect(current_path).to eq("/game_shops/#{@shop2.id}/edit")
      end

      fill_in :name, with: "Game Ville"
      check :does_repairs
      fill_in :stock_limit, with: 15
      click_button "Update Game Shop"

      expect(current_path).to eq("/game_shops/#{@shop2.id}")
      expect(page).to have_content("Game Ville")
      expect(page).to have_content("Does repairs: true")
      expect(page).to have_content("Stock limit: 15")

      expect(page).to_not have_content("GameVille")
      expect(page).to_not have_content("Does repairs: false")
      expect(page).to_not have_content("Stock limit: 5")
    end
  end
end
