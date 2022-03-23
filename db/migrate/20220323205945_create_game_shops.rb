class CreateGameShops < ActiveRecord::Migration[5.2]
  def change
    create_table :game_shops do |t|
      t.string :name
      t.boolean :overstocked
      t.integer :potential_revenue
    end
  end
end
