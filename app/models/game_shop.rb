class GameShop < ApplicationRecord
  has_many :video_games
  validates_presence_of :name, :does_repairs, :stock_limit
end
