class Cat < ApplicationRecord
  belongs_to :board
  has_one :square
  has_many :game_actions

  KINDS = [
    :mike,
    :chatora_shiro,
    :shiro_kuro,
    :kijitora_shiro,
    :sabatora_shiro,
    :shiro,
  ]
  enum :kind, KINDS
  enum :player, [:home, :away]
end
