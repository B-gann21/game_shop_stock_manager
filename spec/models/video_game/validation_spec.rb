require 'rails_helper'

RSpec.describe VideoGame do
  describe "validation" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :rating }
    it { should validate_presence_of :price }
    it { should allow_value(true).for :multiplayer }
    it { should allow_value(false).for :multiplayer }
    it { should_not allow_value(nil).for :multiplayer }
  end
end
