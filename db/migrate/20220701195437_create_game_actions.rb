class CreateGameActions < ActiveRecord::Migration[7.0]
  def change
    create_table :game_actions do |t|
      t.integer :order_id, null: false
      t.integer :player, null: false
      t.integer :from_where
      t.integer :to_where, null: false

      t.timestamps
    end
  end
end
