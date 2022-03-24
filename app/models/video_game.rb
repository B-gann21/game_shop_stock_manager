class VideoGame < ApplicationRecord
  belongs_to :game_shop
  validates_presence_of :name, :rating, :price, :multiplayer
end
