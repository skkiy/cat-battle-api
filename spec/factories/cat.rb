FactoryBot.define do
  factory :cat do
    board { association(:board) }
    square { nil }
    kind { :mike }
    player { :home }
  end
end
