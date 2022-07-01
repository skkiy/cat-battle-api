class Game < ApplicationRecord
  belongs_to :home_user_id, class_name: "User", foreign_key: "fk_games_home_user_id", optional: true
  belongs_to :away_user_id, class_name: "User", foreign_key: "fk_games_away_user_id", optional: true

  enum :first_player, [:home_first, :away_first]
  enum :result, [:home_win, :away_win]
end