class GameService
  def initialize(home_user_id: nil, away_user_id: nil)
    @home_user_id = home_user_id
    @away_user_id = away_user_id
  end

  def call
    first_player = rand(2)
    game = Game.create!(
      home_user_id: @home_user_id,
      away_user_id: @away_user_id,
      first_player: first_player,
    )
    board = Board.create!(game_id: game.id)
    Square.insert_all!(board.square_attributes)
    Cat.insert_all!(board.cat_attributes)
    game
  end
end