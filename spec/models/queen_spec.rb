require 'rails_helper'

RSpec.describe Queen, type: :model do
    describe "#is_obstructed" do
    it "should return true if the move is valid and no piece in its path" do
        queen = Queen.new
        queen.location = "A1"
        allow(Piece).to receive(:where).and_call_original
        result = queen.valid_move?(queen.location, "A8")
        expect(result).to eq (true)
        result = queen.valid_move?(queen.location, "H1")
        expect(result).to eq (true)
        result = queen.valid_move?(queen.location, "H8")
        expect(result).to eq (true)
        queen.location = "H8"
        result = queen.valid_move?(queen.location, "A1")
        expect(result).to eq (true)
        result = queen.valid_move?(queen.location, "A8")
        expect(result).to eq (true)
        result = queen.valid_move?(queen.location, "H1")
        expect(result).to eq (true)
      end
    end
end
