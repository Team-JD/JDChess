class Piece < ActiveRecord::Base
    belongs_to :game

    INACTIVE = "inactive"  
    INITIALIZE = "initialize"
    ACTIVE = "active"

    def move_to!(curr_loc,dest_loc)
        
        dest_piece = game.pieces.where(location: dest_loc).first
        curr_piece = game.pieces.where(location: curr_loc).first

        if dest_piece != nil || dest_piece.color != curr_piece.color 
            dest_piece.piece_status = INACTIVE

            if dest_piece.player != game.player1
                Game::Captured_table_player1[dest_piece.type] += 1
            else
                Game::Captured_table_player2[dest_piece.type] += 1
            end
            game.pieces.destroy(dest_piece.id)

            game.pieces.find(curr_piece.id).update_attributes(location: dest_loc, piece_status: ACTIVE)
        end
    end
    
end
