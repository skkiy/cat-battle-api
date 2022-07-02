class Board < ApplicationRecord
  belongs_to :game
  has_many :squares
  has_many :cats
  has_many :game_actions

  def square_attributes
    Square::PLACE_KEYS.map { |place| { place: place, board_id: id } }
  end

  def cat_attributes
    Cat::KINDS.map { |kind|
      Cat.players.values.map do |player|
        { kind: kind, board_id: id, player: player }
      end
    }.flatten
  end
end