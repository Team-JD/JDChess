require 'rails_helper'

RSpec.describe Bishop, type: :model do
    describe "#valid_move" do
        it "should return true if move is valid from A1 to H8" do
            bishop = Bishop.new
            bishop.location = "A1"
            allow(Piece).to receive(:where).and_call_original
            result = bishop.valid_move?(bishop.location, "H8")
            expect(result).to eq (true)
        end

        it "should return true if move is valid from A8 to H1" do
            bishop = Bishop.new
            bishop.location = "A8"
            allow(Piece).to receive(:where).and_call_original
            result = bishop.valid_move?(bishop.location, "H1")
            expect(result).to eq (true)
        end

        it "should return true if move is valid from A1 to A8" do
            bishop = Bishop.new
            bishop.location = "A1"
            allow(Piece).to receive(:where).and_call_original
            result = bishop.valid_move?(bishop.location, "A8")
            expect(result).to eq (false)
        end
    end
end
