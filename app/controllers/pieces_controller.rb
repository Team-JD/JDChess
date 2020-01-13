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

    private

    def piece_params
        params.require(:piece).permit(:game_id, :player, :color, :type, :location, :piece_status)
    end
end
