require 'rails_helper'

RSpec.describe King, type: :model do
    describe "#valid_move" do
        it "should return true if move is valid from C3 to C2" do
            king = King.new
            king.location = "C3"
            allow(Piece).to receive(:where).and_call_original
            result = king.valid_move?(king.location, "C2")
            expect(result).to eq (true)
        end

        it "should return true if move is valid from C3 to B4" do
            king = King.new
            king.location = "C3"
            allow(Piece).to receive(:where).and_call_original
            result = king.valid_move?(king.location, "B4")
            expect(result).to eq (true)
        end

        it "should return true if move is valid from C3 to B3" do
            king = King.new
            king.location = "C3"
            allow(Piece).to receive(:where).and_call_original
            result = king.valid_move?(king.location, "B3")
            expect(result).to eq (true)
        end
        
        it "should return false if move is valid from C3 to A3" do
            king = King.new
            king.location = "C3"
            allow(Piece).to receive(:where).and_call_original
            result = king.valid_move?(king.location, "A3")
            expect(result).to eq (false)
        end
        
        it "should return false if move is valid from C3 to B1" do
            king = King.new
            king.location = "C3"
            allow(Piece).to receive(:where).and_call_original
            result = king.valid_move?(king.location, "B1")
            expect(result).to eq (false)
        end

        it "should return false if move is valid from C3 to E2" do
            king = King.new
            king.location = "C3"
            allow(Piece).to receive(:where).and_call_original
            result = king.valid_move?(king.location, "E2")
            expect(result).to eq (false)
        end

    end
end
