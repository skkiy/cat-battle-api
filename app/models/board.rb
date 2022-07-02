class Board < ApplicationRecord
  belongs_to :game
  has_many :squares
  has_many :cats
  has_many :game_actions

  class InvalidMoveError < StandardError; end

  # from: Square, to: Square, cat: Cat
  def move_cat(from: nil, to:, cat:)
    raise InvalidMoveError unless can_move?(from: from, to: to, cat: cat)

    ActiveRecord::Base.transaction do
      if from.present?
        from.update!(cat: nil)
      end
      to.update!(cat: cat)
    end
  end

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

  private

  def can_move?(from: nil, to:, cat:)
    # destination is already filled
    return false if to.cat.present?
    # source cat is not specified cat
    return false if from.present? && from.cat != cat
    return true
  end
end
