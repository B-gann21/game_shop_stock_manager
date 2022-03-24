require 'rails_helper'

RSpec.describe VideoGame, type: :model do
  describe "validation" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :rating }
    it { should validate_presence_of :price }
    it { should validate_presence_of :multiplayer }
  end
end
