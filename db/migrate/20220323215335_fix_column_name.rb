class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :game_shops, :potential_revenue, :stock_limit 
  end
end
