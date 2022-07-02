require 'rails_helper'

describe GameService do
  describe "#call" do
    let(:service) { GameService.new(home_user_id: nil, away_user_id: nil) }

    context "succeed execution" do
      it "returns a new game" do
        expect(service.call).to eq(Game.last)
      end

      it "creates related records" do
        expect { service.call }.to change { Game.count }.from(0).to(1)
                                                        .and(change { Board.count }.from(0).to(1))
                                                        .and(change { Square.count }.from(0).to(16))
                                                        .and(change { Cat.count }.from(0).to(12))
        expect(Game.last).to have_attributes(
                               home_user: nil,
                               away_user: nil,
                               first_player: "home_first",
                               result: nil,
                             )
        expect(Board.last).to have_attributes(
                                game_id: Game.last.id,
                              )
        expect(Square.last).to have_attributes(
                                 place: 44,
                                 board_id: Board.last.id,
                                 cat_id: nil,
                               )
      end
    end
  end
end
