class GameShop < ApplicationRecord
  has_many :video_games
  validates_presence_of :name, :stock_limit
  validates_inclusion_of :does_repairs, in: [true, false]

  def games_over_price(price)
    video_games.where("price > 55")
  end

  def alphabetized_video_games
    video_games.order(:name)
  end

  def total_games_in_stock
    video_games.count
  end

  def self.order_by_created_at
    order("created_at desc")
  end
end
