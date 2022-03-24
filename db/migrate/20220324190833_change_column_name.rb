class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :game_shops, :overstocked, :does_repairs
  end
end
