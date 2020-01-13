require 'rails_helper'

RSpec.describe King, type: :model do
    describe "#is_obstructed" do
        it "should return true if move is valid and no piece in it path" do
            user1 = FactoryBot.create(:user)
            game = user1.games.create
            blk_king1 = FactoryBot.create(:king, location: "D1", game_id: game.id, player: user1.email, color: "B", type: "king")
            blk_Pawn1 = FactoryBot.create(:pawn, location: "D2", game_id: game.id, player: user1.email, color: "B", type: "Pawn")
            result = blk_king1.valid_move?(blk_king1.location,"E1")
            expect(result).to eq (true)
        end
    end
end
