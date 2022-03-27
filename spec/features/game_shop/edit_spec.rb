require 'rails_helper'

RSpec.describe "GameShop#edit" do
  before :each do
    @shop1 = GameShop.create!(name: "Fred's Games", does_repairs: false, stock_limit: 3)
    visit "/game_shops/#{@shop1.id}"
  end
  # As a visitor
  # When I visit a parent show page
  # Then I see a link to update the parent "Update Parent"
  # When I click the link "Update Parent"
  # Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
  # When I fill out the form with updated information
  # And I click the button to submit the form
  # Then a `PATCH` request is sent to '/parents/:id',
  # the parent's info is updated,
  # and I am redirected to the Parent's Show page where I see the parent's updated info
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
      click_button "Update Game Shop"

      expect(current_path).to eq("/game_shops/#{@shop1.id}")
      expect(page).to have_content("Fred's Game Shop")
      expect(page).to have_content("Does repairs: true")
    end
  end
end
