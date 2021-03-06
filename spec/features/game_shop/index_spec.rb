require 'rails_helper'

RSpec.describe 'GameShops' do
  before :each do
    VideoGame.destroy_all
    GameShop.destroy_all

    @shop1 = GameShop.create!(name: "Fred's Games", does_repairs: false, stock_limit: 3)
    @shop2 = GameShop.create!(name: "Gameville", does_repairs: false, stock_limit: 5)
    @shop3 = GameShop.create!(name: "GoodGames", does_repairs: false, stock_limit: 5)
    @game1 = @shop1.video_games.create!(name: "DOOM 2016", rating: "M", price: 70, multiplayer: false)
    @game2 = @shop1.video_games.create!(name: "FIFA 2020", rating: "E", price: 55, multiplayer: true)
    @game3 = @shop2.video_games.create!(name: "Elden Ring", rating: "M", price: 65, multiplayer: true)

    visit '/game_shops'
  end

  context '#index' do
    it 'displays all names' do
      expect(page).to have_content(@shop1.name)
      expect(page).to have_content(@shop2.name)
    end

    it 'displays in order of created_at attribute' do
      expect("#{@shop1.name}").to_not appear_before("#{@shop2.name}")
      expect("#{@shop1.name}").to_not appear_before("#{@shop3.name}")

      expect("#{@shop2.name}").to appear_before("#{@shop1.name}")
      expect("#{@shop2.name}").to_not appear_before("#{@shop3.name}")

      expect("#{@shop3.name}").to appear_before("#{@shop1.name}")
      expect("#{@shop3.name}").to appear_before("#{@shop2.name}")
    end

    it 'displays created_at attributes next to the names' do
      within "#game-shop-#{@shop1.id}" do
        expect(page).to have_content(@shop1.name)
        expect(page).to have_content("Created: #{@shop1.created_at}")
      end

      within "#game-shop-#{@shop2.id}" do
        expect(page).to have_content(@shop2.name)
        expect(page).to have_content("Created: #{@shop2.created_at}")
      end

      within "#game-shop-#{@shop3.id}" do
        expect(page).to have_content(@shop3.name)
        expect(page).to have_content("Created: #{@shop3.created_at}")
      end
    end
  end

  context 'index links' do
    it 'displays a link to the VideoGame index' do
      expect(page).to have_link('Video Game Index')

      click_link('Video Game Index')

      expect(page).to_not have_content(@game1.name)
      expect(page).to have_content(@game2.name)
      expect(page).to have_content(@game3.name)
    end

    it 'displays a link to the GameShop index' do
      expect(page).to have_link('Game Shop Index')

      click_link('Game Shop Index')

      expect(page).to have_content(@shop1.name)
      expect(page).to have_content(@shop2.name)
      expect(page).to have_content(@shop3.name)
    end

    it 'should display links at the bottom of the page' do
      expect("Game Shop Index").to_not appear_before(@shop1.name)
      expect("Game Shop Index").to_not appear_before(@shop2.name)
      expect("Game Shop Index").to_not appear_before(@shop3.name)

      expect("Video Game Index").to_not appear_before(@shop1.name)
      expect("Video Game Index").to_not appear_before(@shop2.name)
      expect("Video Game Index").to_not appear_before(@shop3.name)
    end
  end

  context 'show links' do
    it 'has the name of each GameShop as a link to its show page' do
      expect(page).to have_link("Fred's Games")
      expect(page).to have_link("Gameville")
      expect(page).to have_link("GoodGames")
    end

    it "clicking on Fred's Games brings you to it's show page" do
      click_link("Fred's Games")

      expect(current_path).to eq("/game_shops/#{@shop1.id}")
    end

    it "clicking on GameVille takes you to it's show page" do
      click_link("Gameville")

      expect(current_path).to eq("/game_shops/#{@shop2.id}")
    end

    it "clicking on GoodGames takes you to it's show page" do
      click_link("GoodGames")

      expect(current_path).to eq("/game_shops/#{@shop3.id}")
    end
  end
end
