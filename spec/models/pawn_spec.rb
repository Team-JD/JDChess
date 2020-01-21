require 'rails_helper'

RSpec.describe Pawn, type: :model do
    describe "#valid_move?" do
        it "should return false when it moves from A2 to A8" do
            game = Game.new
            pawn1 = Pawn.new
            game.pieces << pawn1
            pawn1.location = "A2"
            pawn1.piece_status = "Active"
            allow(Piece).to receive(:where).and_call_original
            result = pawn1.valid_move?(pawn1.location, "A8")
            expect(result).to eq (false)
        end

        it "should return true when it moves from A2 to A3" do
            game = Game.new
            pawn1 = Pawn.new
            game.pieces << pawn1
            pawn1.location = "A2"
            pawn1.piece_status = "Active"
            allow(Piece).to receive(:where).and_call_original
            result = pawn1.valid_move?(pawn1.location, "A3")
            expect(result).to eq (true)
        end

        it "should return true when it moves from A2 to A4 and piece is inactive which would be its first move" do
            game = Game.new
            pawn1 = Pawn.new
            game.pieces << pawn1
            pawn1.location = "A2"
            allow(Piece).to receive(:where).and_call_original
            result = pawn1.valid_move?(pawn1.location, "A4")
            expect(result).to eq (true)
        end
        
        it "should return false when it moves from A3 to A5 and piece is active which would not be its first move" do
            game = Game.new
            pawn1 = Pawn.new
            game.pieces << pawn1
            pawn1.location = "A3"
            pawn1.piece_status = "Active"
            allow(Piece).to receive(:where).and_call_original
            result = pawn1.valid_move?(pawn1.location, "A5")
            expect(result).to eq (false)
        end

        it "should return false when it moves from A2 to B3 when there is no piece at B3" do
            game = Game.new
            pawn1 = Pawn.new
            game.pieces << pawn1
            pawn1.location = "A2"
            pawn1.piece_status = "Active"
            allow(Piece).to receive(:where).and_call_original
            result = pawn1.valid_move?(pawn1.location, "B3")
            expect(result).to eq (false)
        end

        it "should return false when it moves from A2 to B3 when the piece at B3 is on the same team" do
            game = Game.new
            pawn1 = Pawn.new
            pawn2 = Pawn.new
            game.pieces << pawn1
            game.pieces << pawn2
            pawn1.location = "A2"
            pawn2.location = "B3"
            pawn1.piece_status = "Active"
            allow(Piece).to receive(:where).and_call_original
            result = pawn1.valid_move?(pawn1.location, "B3")
            expect(result).to eq (false)
        end

        it "should return true when it moves from A2 to B3 when the piece at B3 is not on the same team" do
            game = Game.new
            pawn1 = Pawn.new
            pawn2 = Pawn.new
            game.pieces << pawn1
            game.pieces << pawn2
            pawn1.location = "A2"
            pawn2.location = "B3"
            pawn2.color = "W"
            pawn1.piece_status = "Active"
            allow(Piece).to receive(:where).and_call_original
            result = pawn1.valid_move?(pawn1.location, "B3")
            expect(result).to eq (true)
        end
    end
end
