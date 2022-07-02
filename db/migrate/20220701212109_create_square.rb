class CreateSquare < ActiveRecord::Migration[7.0]
  def change
    create_table :squares do |t|
      t.integer :place, null: false
      t.bigint :board_id, null: false
      t.bigint :cat_id

      t.timestamps
    end
    add_index(:squares, [:place, :board_id], unique: true)
    add_foreign_key :squares, :boards
    add_foreign_key :squares, :cats
  end
end
