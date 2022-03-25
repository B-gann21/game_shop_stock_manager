class GameShop < ApplicationRecord
  has_many :video_games
  validates_presence_of :name, :stock_limit
  validates_inclusion_of :does_repairs, in: [true, false]

  def total_games_in_stock
    self.video_games.count
  end
end
