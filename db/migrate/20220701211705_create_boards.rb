class CreateBoards < ActiveRecord::Migration[7.0]
  def change
    create_table :boards, force: :cascade do |t|
      t.bigint :game_id
      t.timestamps
    end
    add_foreign_key :boards, :games
    add_index :boards, [:id, :game_id], unique: true
  end
end
