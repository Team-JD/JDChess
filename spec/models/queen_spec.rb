require 'rails_helper'

RSpec.describe Queen, type: :model do
    describe "#valid_move" do
    it "should return true if the move is valid from A1 to A8" do
        queen = Queen.new
        queen.location = "A1"
        allow(Piece).to receive(:where).and_call_original
        result = queen.valid_move?(queen.location, "A8")
      end

      it "should return true if the move is valid from A1 to H8" do
        queen = Queen.new
        queen.location = "A1"
        allow(Piece).to receive(:where).and_call_original
        result = queen.valid_move?(queen.location, "H8")
        expect(result).to eq (true)
      end

      it "should return true if the move is valid from A1 to H1" do
        queen = Queen.new
        queen.location = "A1"
        allow(Piece).to receive(:where).and_call_original
        result = queen.valid_move?(queen.location, "H1")
        expect(result).to eq (true)
      end

      it "should return false if the move is valid from A1 to B3" do
        queen = Queen.new
        queen.location = "A1"
        allow(Piece).to receive(:where).and_call_original
        result = queen.valid_move?(queen.location, "B3")
        expect(result).to eq (false)
      end

      it "should return false if the move is valid from A1 to B5" do
        queen = Queen.new
        queen.location = "A1"
        allow(Piece).to receive(:where).and_call_original
        result = queen.valid_move?(queen.location, "B5")
        expect(result).to eq (false)
      end
    end
end
