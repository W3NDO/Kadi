class CreateDecks < ActiveRecord::Migration[7.0]
  def change
    create_table :decks do |t|
      t.json :cards

      t.timestamps
    end
  end
end
