require 'rails_helper'

RSpec.describe "VideoGame instance methods" do
  before :each do
    @game1 = @shop1.video_games.create!(name: "DOOM 2016", rating: "M", price: 70, multiplayer: false)
    @game2 = @shop1.video_games.create!(name: "FIFA 2020", rating: "E", price: 55, multiplayer: true)
    @game3 = @shop1.video_games.create!(name: "Elden Ring", rating: "M", price: 65, multiplayer: true)
  end

  context "VideoGame#multiplayer_only" do
    it 'only returns multiplayer games' do
      expect(VideoGame.multiplayer_only).to eq([@game2, @game3])
    end
  end
end
