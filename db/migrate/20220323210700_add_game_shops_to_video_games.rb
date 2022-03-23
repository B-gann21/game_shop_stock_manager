class AddGameShopsToVideoGames < ActiveRecord::Migration[5.2]
  def change
    add_reference :video_games, :game_shop, foreign_key: true
  end
end
