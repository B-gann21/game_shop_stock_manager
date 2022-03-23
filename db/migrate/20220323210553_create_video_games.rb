class CreateVideoGames < ActiveRecord::Migration[5.2]
  def change
    create_table :video_games do |t|
      t.string :name
      t.string :rating
      t.integer :price
      t.boolean :multiplayer

      t.timestamps
    end
  end
end
