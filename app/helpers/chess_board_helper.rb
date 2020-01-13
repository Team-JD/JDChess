module ChessBoardHelper
  def render_piece (current_game, row_position, column_position)
        #game = Game.find(current_game.id)
        piece = current_game.pieces.where(row_position: row_position, column_position: column_position).first
        if piece != nil
          then return piece.type
        else return nil
        end
  end
end
