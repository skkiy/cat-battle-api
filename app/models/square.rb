class Square < ApplicationRecord
  belongs_to :board
  belongs_to :cat, optional: true

  PLACE_KEYS = (1..4).to_a.repeated_permutation(2).to_a.map { |x, y| "#{x}#{y}".to_i }.freeze
end
