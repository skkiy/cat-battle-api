require 'rails_helper'

describe Board, type: :model do
  let(:game) { create(:game) }
  let(:board) { create(:board, game: game) }

  describe "#move_cat" do
    let(:from) { board.squares[0] }
    let(:to) { board.squares[1] }
    let(:cat) { board.cats[0] }

    context "when from is nil" do
      it "succeed" do
        expect { board.move_cat(to: to, cat: cat) }.not_to raise_error
      end

      it "put cat on square" do
        expect { board.move_cat(to: to, cat: cat) }.to change { to.cat }.from(nil).to(cat)
      end
    end

    context "when from is not nil" do
      context "from.cat is specified cat" do
        before do
          from.cat = cat
        end
        it "succeed" do
          expect { board.move_cat(from: from, to: to, cat: cat) }.not_to raise_error
        end

        it "move cat on square" do
          expect { board.move_cat(from: from, to: to, cat: cat) }.to change { to.cat }.from(nil).to(cat)
        end
      end

      context "when from.cat is not specified cat" do
        before do
          from.cat = board.cats[2]
        end
        it "raise InvalidMoveError" do
          expect { board.move_cat(from: from, to: to, cat: cat) }.to raise_error(Board::InvalidMoveError)
        end
      end
    end

    context "when to.cat is not nil" do
      before do
        to.cat = board.cats[1]
      end

      it "raise InvalidMoveError" do
        expect { board.move_cat(to: to, cat: cat) }.to raise_error(Board::InvalidMoveError)
      end
    end
  end
end