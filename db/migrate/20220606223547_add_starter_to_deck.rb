class AddStarterToDeck < ActiveRecord::Migration[7.0]
  def change
    add_column :decks, :starter_card, :json
  end
end
