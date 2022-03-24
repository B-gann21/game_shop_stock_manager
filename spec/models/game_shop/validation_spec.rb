require 'rails_helper'

RSpec.describe GameShop, type: :model do
  describe "validation" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :does_repairs }
    it { should validate_presence_of :stock_limit }
  end
end
