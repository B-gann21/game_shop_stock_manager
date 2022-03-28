class VideoGame < ApplicationRecord
  belongs_to :game_shop
  validates_presence_of :name, :rating, :price
  validates_inclusion_of :multiplayer, in: [true, false]

  def self.multiplayer_only
    where(multiplayer: true)
  end
end
