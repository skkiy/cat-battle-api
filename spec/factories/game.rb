FactoryBot.define do
  factory :game do
    home_user { nil }
    away_user { nil }
    first_player { :home_first }
    result { nil }
  end
end