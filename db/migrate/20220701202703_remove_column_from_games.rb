class RemoveColumnFromGames < ActiveRecord::Migration[7.0]
  def change
    remove_column :games, :winner, :string
  end
end
