require 'rails_helper'

RSpec.describe GameShop, type: :model do
  describe 'relationships' do
    it { should have_many(:video_games)}
  end
end
