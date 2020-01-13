require 'rails_helper'

RSpec.describe King, type: :model do
    describe "#is_obstructed" do
        it "should return true if move is valid " do
            king = King.new
            king.location = "C3"
            allow(Piece).to receive(:where).and_call_original
            result = king.valid_move?(king.location, "C2")
            expect(result).to eq (true)
            result = king.valid_move?(king.location, "C4")
            expect(result).to eq (true)
            result = king.valid_move?(king.location, "B4")
            expect(result).to eq (true)
            result = king.valid_move?(king.location, "B3")
            expect(result).to eq (true)
            result = king.valid_move?(king.location, "B2")
            expect(result).to eq (true)
            result = king.valid_move?(king.location, "D4")
            expect(result).to eq (true)
            result = king.valid_move?(king.location, "D3")
            expect(result).to eq (true)
            result = king.valid_move?(king.location, "D2")
            expect(result).to eq (true)
        end
    end
end
