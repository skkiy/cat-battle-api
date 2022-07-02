class Game < ApplicationRecord
  belongs_to :home_user, class_name: "User", optional: true
  belongs_to :away_user, class_name: "User", optional: true
  has_one :board
  enum :first_player, [:home_first, :away_first]
  enum :result, [:home_win, :away_win]
end
