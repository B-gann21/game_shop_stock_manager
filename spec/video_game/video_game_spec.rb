require 'rails-helper'

RSpec.describe VideoGame do
  describe 'relationships' do
    it { should belong_to(:game_shop)}
  end
end
