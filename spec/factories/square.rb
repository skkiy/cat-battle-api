FactoryBot.define do
  factory :square do
    board { association(:board) }
    transient do
      cats { build_list(:cat, 12) }
    end
  end
end