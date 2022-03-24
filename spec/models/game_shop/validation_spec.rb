require 'rails_helper'

RSpec.describe GameShop, type: :model do
  describe "validation" do
    it { should validate_presence_of :name, :does_repairs, :stock_limit }
  end
end
