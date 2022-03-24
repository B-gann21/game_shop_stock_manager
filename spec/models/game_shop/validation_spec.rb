require 'rails_helper'

RSpec.describe GameShop, type: :model do
  describe "validation" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :stock_limit }
    it { should allow_value(true).for :does_repairs }
    it { should allow_value(false).for :does_repairs }
    it { should_not allow_value(nil).for :does_repairs }
  end
end
