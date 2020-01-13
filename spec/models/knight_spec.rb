require 'rails_helper'

RSpec.describe Knight, type: :model do
    describe "#is_obstructed" do
        it "should return true if move is valid " do
        knight = Knight.new
        knight.location = "C3"
        allow(Piece).to receive(:where).and_call_original
        result = knight.valid_move?(knight.location, "B5")
        expect(result).to eq (true)
        result = knight.valid_move?(knight.location, "D5")
        expect(result).to eq (true)
        result = knight.valid_move?(knight.location, "B1")
        expect(result).to eq (true)
        result = knight.valid_move?(knight.location, "D1")
        expect(result).to eq (true)
        result = knight.valid_move?(knight.location, "A2")
        expect(result).to eq (true)
        result = knight.valid_move?(knight.location, "A4")
        expect(result).to eq (true)
        result = knight.valid_move?(knight.location, "E2")
        expect(result).to eq (true)
        result = knight.valid_move?(knight.location, "E4")
        expect(result).to eq (true)
        end
    end
end
