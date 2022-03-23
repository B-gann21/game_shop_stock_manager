require 'rails_helper'

RSpec.describe GameShop do
  describe 'relationships' do
    it { should have_many(:video_games)}
  end
end
