class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.bigint :home_user_id
      t.bigint :away_user_id
      t.integer :first_player, default: 0, null: false
      t.integer :winner

      t.timestamps
    end
    add_foreign_key :games, :users, column: :home_user_id
    add_foreign_key :games, :users, column: :away_user_id
  end
end
