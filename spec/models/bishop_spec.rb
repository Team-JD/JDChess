require 'rails_helper'

RSpec.describe Bishop, type: :model do
    describe "#is_obstructed" do
        it "should return true if move is valid and no piece in it path" do
            game = game.create
            blk_bishop1 = FactoryBot.create(:bishop, location: "A3", game_id: game.id, player: user1.email, color: "B", type: "bishop")
            blk_Pawn1 = FactoryBot.create(:pawn, location: "D4", game_id: game.id, player: user1.email, color: "B", type: "Pawn")
            result = blk_bishop1.valid_move?(blk_bishop1.location,"C5")
            expect(result).to eq (true)
        end
    end
end
