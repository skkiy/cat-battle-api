FactoryBot.define do
  factory :board do
    game { association(:game) }

    after(:build) do |board|
      Square::PLACE_KEYS.each do |place|
        board.squares << create(:square, place: place, board: board)
      end
      Cat::KINDS.each do |kind|
        Cat.players.keys.each do |player|
          board.cats << create(:cat, board: board, kind: kind, player: player)
        end
      end
    end
  end
end