require 'rails_helper'

RSpec.describe Rook, type: :model do
  describe "#moves" do
    it "should return true if it move horizontally" do
      rook = Rook.new
      rook.location = "A1"
      allow(Piece).to receive(:where).and_call_original
      result = rook.valid_move?(rook.location, "A8")
      expect(result).to eq (true)
    end

    it "should return true if it move vertically" do
      rook = Rook.new
      rook.location = "A1"
      allow(Piece).to receive(:where).and_call_original
      result = rook.valid_move?(rook.location, "G1")
      expect(result).to eq (true)
    end

    it "should return false if it move diagonaly" do
      rook = Rook.new
      rook.location = "A1"
      allow(Piece).to receive(:where).and_call_original
      result = rook.valid_move?(rook.location, "G8")
      expect(result).to eq (false)
    end
  end
end
