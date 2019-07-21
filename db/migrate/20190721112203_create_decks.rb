class CreateDecks < ActiveRecord::Migration[5.2]
  def change
    create_table :decks do |t|

      t.timestamps
      t.integer :user_id
      t.string :deck_name
      t.string :body
    end
  end
end
