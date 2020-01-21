require 'rails_helper'

RSpec.describe Rook, type: :model do
  describe "#valid_move" do
    it "should return true if move is valid from A1 to A8" do
      rook = Rook.new
      rook.location = "A1"
      allow(Piece).to receive(:where).and_call_original
      result = rook.valid_move?(rook.location, "A8")
      expect(result).to eq (true)
    end

    it "should return true if move is valid from A1 to G1" do
      rook = Rook.new
      rook.location = "A1"
      allow(Piece).to receive(:where).and_call_original
      result = rook.valid_move?(rook.location, "G1")
      expect(result).to eq (true)
    end

    it "should return false if move is not valid from A1 to G8" do
      rook = Rook.new
      rook.location = "A1"
      allow(Piece).to receive(:where).and_call_original
      result = rook.valid_move?(rook.location, "G8")
      expect(result).to eq (false)
    end
  end
end
