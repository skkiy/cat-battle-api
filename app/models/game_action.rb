class GameAction < ApplicationRecord
  belongs_to :board
  belongs_to :cat
end