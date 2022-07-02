class CreateGameActions < ActiveRecord::Migration[7.0]
  def change
    create_table :game_actions do |t|
      t.integer :order, null: false
      t.integer :player, null: false
      t.integer :from_where
      t.integer :to_where, null: false
      t.bigint :board_id, null: false
      t.bigint :cat_id, null: false

      t.timestamps
    end
    add_index :game_actions, [:board_id, :order], unique: true
    add_foreign_key :game_actions, :boards
    add_foreign_key :game_actions, :cats
  end
end
