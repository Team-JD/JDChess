require 'rails_helper'

RSpec.describe Piece, type: :model do
    describe "#is_obstructed" do
        it "should return false if there is a piece obstructing horizontal move from A1 to A8 with pawn at A4" do
            user1 = FactoryBot.create(:user)
            game = Game.create
            blk_Rook1 = FactoryBot.create(:piece, location: "A1", game_id: game.id, player: user1.email, color: "B", type: "Rook")
            blk_Pawn1 = FactoryBot.create(:piece, location: "A4", game_id: game.id, player: user1.email, color: "B", type: "Pawn")
            result = game.is_obstructed(blk_Rook1.location,"A8")
            expect(result).to eq (false)
        end

        it "should return false if there is a piece obstructing vertical move from A1 to H1 with pawn at C1" do
            user1 = FactoryBot.create(:user)
            game = Game.create
            blk_Rook1 = FactoryBot.create(:piece, location: "A1", game_id: game.id, player: user1.email, color: "B", type: "Rook")
            blk_Pawn1 = FactoryBot.create(:piece, location: "C1", game_id: game.id, player: user1.email, color: "B", type: "Pawn")
            result = game.is_obstructed(blk_Rook1.location,"H1")
            expect(result).to eq (false)
        end

        it "should return false if there is a piece obstructing diagonal move from A1 to H8 with pawn at D4" do
            user1 = FactoryBot.create(:user)
            game = Game.create
            blk_bishop1 = FactoryBot.create(:piece, location: "A1", game_id: game.id, player: user1.email, color: "B", type: "Bishop")
            blk_Pawn1 = FactoryBot.create(:piece, location: "D4", game_id: game.id, player: user1.email, color: "B", type: "Pawn")
            result = game.is_obstructed(blk_bishop1.location,"H8")
            expect(result).to eq (false)
        end

        it "should return false if there is an invalid input of H9" do
            user1 = FactoryBot.create(:user)
            game = Game.create
            blk_bishop1 = FactoryBot.create(:piece, location: "A1", game_id: game.id, player: user1.email, color: "B", type: "Bishop")
            blk_Pawn1 = FactoryBot.create(:piece, location: "D4", game_id: game.id, player: user1.email, color: "B", type: "Pawn")
            result = game.is_obstructed(blk_bishop1.location,"H9")
            expect(result).to eq (false)
        end

        it "should return false if there is an invalid input of I1" do
            user1 = FactoryBot.create(:user)
            game = Game.create
            blk_bishop1 = FactoryBot.create(:piece, location: "A1", game_id: game.id, player: user1.email, color: "B", type: "Bishop")
            blk_Pawn1 = FactoryBot.create(:piece, location: "D4", game_id: game.id, player: user1.email, color: "B", type: "Pawn")
            result = game.is_obstructed(blk_bishop1.location,"I1")
            expect(result).to eq (false)
        end
  end
end
