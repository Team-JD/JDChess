class PiecesController < ApplicationController

    def new
        @piece = Piece.new
    end

    def create
        @game = Game.find_by_id(params[:game_id])
        return render_not_found if @game.blank?
        @piece = game.piece
        @piece.create(piece_params)
    end

    def show
        puts "--------------------------------"
        game = Game.find(params[:game_id].to_i)
        piece = game.pieces.where(column_position: params[:column].to_i, row_position: params[:row].to_i).first
        puts piece
        #@piece = Pieces.find(params[:id])
        #return render_not_found if @piece.blank? 
        #@piece = game.piece
        #@piece.select(piece_params)
        return
    end

    def update
        @piece = Pieces.find(params[:id])
        #@piece.update = piece.row_position piece.column_position
    end
 

    private

    def piece_params
        params.require(:piece).permit(:game_id, :player, :color, :type, :location, :piece_status)
    end
end
