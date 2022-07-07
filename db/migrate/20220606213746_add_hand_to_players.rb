class AddHandToPlayers < ActiveRecord::Migration[7.0]
  def change
    add_column :players, :hand, :text
  end
end
