class CreateCats < ActiveRecord::Migration[7.0]
  def change
    create_table :cats do |t|
      t.integer :kind, null: false
      t.integer :player
      t.bigint :board_id, null: false

      t.timestamps
    end
    add_foreign_key :cats, :boards
    add_index :cats, [:board_id, :kind, :player], unique: true
  end
end
