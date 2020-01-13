require 'rails_helper'

RSpec.describe Bishop, type: :model do
    describe "#is_obstructed" do
        it "should return true if move is valid " do
            bishop = Bishop.new
            bishop.location = "A1"
            allow(Piece).to receive(:where).and_call_original
            result = bishop.valid_move?(bishop.location, "H8")
            expect(result).to eq (true)
            bishop.location = "A8"
            result = bishop.valid_move?(bishop.location, "H1")
            expect(result).to eq (true)
        end
    end
end
