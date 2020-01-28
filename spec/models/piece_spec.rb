require 'rails_helper'

RSpec.describe Piece, type: :model do

    describe "#is_obstructed" do
        it "should return false if there is a piece obstructing horizontal move from A1 to A8 with pawn at A4" do
            user1 = FactoryBot.create(:user)
            game = Game.create
            game.pieces.destroy_all
            blk_Rook1 = FactoryBot.create(:piece, location: "A1", game_id: game.id, player: "user1.email@gmail.com", color: "B", type: "Rook")
            blk_Pawn1 = FactoryBot.create(:piece, location: "A4", game_id: game.id, player: "user1.email@gmail.com", color: "B", type: "Pawn")
            game.pieces.push(blk_Rook1)
            game.pieces.push(blk_Pawn1)
            result = game.is_obstructed(blk_Rook1.location,"A8")
            expect(result).to eq (true)
        end

        it "should return false if there is a piece obstructing vertical move from A1 to H1 with pawn at C1" do
            user1 = FactoryBot.create(:user)
            user1.email = "#{user1.id}" + user1.email
            game = Game.create
            game.pieces.destroy_all
            blk_Rook1 = FactoryBot.create(:piece, location: "A1", game_id: game.id, player: "user1.email@gmail.com", color: "B", type: "Rook")
            blk_Pawn1 = FactoryBot.create(:piece, location: "C1", game_id: game.id, player: "user1.email@gmail.com", color: "B", type: "Pawn")
            game.pieces.push(blk_Rook1)
            game.pieces.push(blk_Pawn1)
            result = game.is_obstructed(blk_Rook1.location,"H1")
            expect(result).to eq (true)
        end

        it "should return false if there is a piece obstructing diagonal move from A1 to H8 with pawn at D4" do
            user1 = FactoryBot.create(:user)
            user1.email = "#{user1.id}" + user1.email
            game = Game.create
            game.pieces.destroy_all
            blk_bishop1 = FactoryBot.create(:piece, location: "A1", game_id: game.id, player: user1.email, color: "B", type: "Bishop")
            blk_Pawn1 = FactoryBot.create(:piece, location: "D4", game_id: game.id, player: user1.email, color: "B", type: "Pawn")
            game.pieces.push(blk_bishop1)
            game.pieces.push(blk_Pawn1)
            result = game.is_obstructed(blk_bishop1.location,"H8")
            expect(result).to eq (true)
        end

        it "should raise a range error if there is an invalid input of H9" do
            user1 = FactoryBot.create(:user)
            game = Game.create
            game.pieces.destroy_all
            blk_bishop1 = FactoryBot.create(:piece, location: "A1", game_id: game.id, player: user1.email, color: "B", type: "Bishop")
            blk_Pawn1 = FactoryBot.create(:piece, location: "D4", game_id: game.id, player: user1.email, color: "B", type: "Pawn")
            game.pieces.push(blk_bishop1)
            game.pieces.push(blk_Pawn1)
            expect{game.is_obstructed(blk_bishop1.location,"H9")}.to raise_error(RangeError)
        end

        it "should return raise a Range error if there is an invalid input of I1" do
            user1 = FactoryBot.create(:user)
            game = Game.create
            game.pieces.destroy_all
            blk_bishop1 = FactoryBot.create(:piece, location: "A1", game_id: game.id, player: user1.email, color: "B", type: "Bishop")
            blk_Pawn1 = FactoryBot.create(:piece, location: "D4", game_id: game.id, player: user1.email, color: "B", type: "Pawn")
            game.pieces.push(blk_bishop1)
            game.pieces.push(blk_Pawn1)
            expect{game.is_obstructed(blk_bishop1.location,"I1")}.to raise_error(RangeError)
        end
    end

    describe "#capture" do
        it "should update the captured table" do
            user1 = FactoryBot.create(:user)
            user2 = FactoryBot.create(:user)
            game = Game.create
            game.player1 = user1.email
            game.player2 = user2.email
            game.pieces.destroy_all
            blk_bishop1 = FactoryBot.create(:piece, location: "D1", game_id: game.id, player: user1.email, color: "B", type: "Bishop", piece_status: Piece::INITIALIZE)
            blk_Pawn1 = FactoryBot.create(:piece, location: "D4", game_id: game.id, player: user2.email, color: "B", type: "Pawn", piece_status: Piece::INITIALIZE)
            game.pieces.push(blk_bishop1)
            game.pieces.push(blk_Pawn1)
            blk_bishop1.move_to!("D1","D4")
            result = Game::Captured_table_player1[blk_Pawn1.type]
            expect(result).to eq (1)
        end

        it "should delete the piece from the game and return record not found when piece is deleted" do
            user1 = FactoryBot.create(:user)
            user2 = FactoryBot.create(:user)
            game = Game.create
            game.player1 = user1.email
            game.player2 = user2.email
            game.pieces.destroy_all
            blk_bishop1 = FactoryBot.create(:piece, location: "D1", game_id: game.id, player: user1.email, color: "B", type: "Bishop", piece_status: Piece::INITIALIZE)
            blk_Pawn1 = FactoryBot.create(:piece, location: "D4", game_id: game.id, player: user2.email, color: "B", type: "Pawn", piece_status: Piece::INITIALIZE)
            game.pieces.push(blk_bishop1)
            game.pieces.push(blk_Pawn1)
            blk_bishop1.move_to!("D1","D4")
            expect { game.pieces.find(blk_Pawn1.id) }.to raise_exception(ActiveRecord::RecordNotFound)
        end

        it "should update its location after piece is deleted" do
            user1 = FactoryBot.create(:user)
            user2 = FactoryBot.create(:user)
            game = Game.create
            game.player1 = user1.email
            game.player2 = user2.email
            game.pieces.destroy_all
            blk_bishop1 = FactoryBot.create(:piece, location: "D1", game_id: game.id, player: user1.email, color: "B", type: "Bishop", piece_status: Piece::INITIALIZE)
            blk_Pawn1 = FactoryBot.create(:piece, location: "D4", game_id: game.id, player: user2.email, color: "B", type: "Pawn", piece_status: Piece::INITIALIZE)
            game.pieces.push(blk_bishop1)
            game.pieces.push(blk_Pawn1)
            blk_bishop1.move_to!("D1","D4")
            result = game.pieces.where(location: "D4").first
            expect(result.location).to eq (blk_Pawn1.location)
        end
    end
    
end
