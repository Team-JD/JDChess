require 'rails_helper'

RSpec.describe Knight, type: :model do
    describe "#valid_move" do
        it "should return true if move is valid from C3 to B5" do
            knight = Knight.new
            knight.location = "C3"
            allow(Piece).to receive(:where).and_call_original
            result = knight.valid_move?(knight.location, "B5")
            expect(result).to eq (true)
        end

        it "should return true if move is valid from C3 to D5 " do
            knight = Knight.new
            knight.location = "C3"
            allow(Piece).to receive(:where).and_call_original
            result = knight.valid_move?(knight.location, "D5")
            expect(result).to eq (true)
        end

        it "should return true if move is valid from C3 to A2" do
            knight = Knight.new
            knight.location = "C3"
            allow(Piece).to receive(:where).and_call_original
            result = knight.valid_move?(knight.location, "A2")
            expect(result).to eq (true)
        end

        it "should return false if move is valid from C3 to C5" do
            knight = Knight.new
            knight.location = "C3"
            allow(Piece).to receive(:where).and_call_original
            result = knight.valid_move?(knight.location, "C5")
            expect(result).to eq (false)
        end

        it "should return false if move is valid from C3 to D6" do
            knight = Knight.new
            knight.location = "C3"
            allow(Piece).to receive(:where).and_call_original
            result = knight.valid_move?(knight.location, "D6")
            expect(result).to eq (false)
        end
        it "should return false if move is valid from C3 to A5" do
            knight = Knight.new
            knight.location = "C3"
            allow(Piece).to receive(:where).and_call_original
            result = knight.valid_move?(knight.location, "A5")
            expect(result).to eq (false)
        end
    end
end
