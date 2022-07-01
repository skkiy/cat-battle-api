class AddBoardToGames < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :board, :json
  end
end
