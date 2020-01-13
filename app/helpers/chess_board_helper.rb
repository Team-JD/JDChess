module ChessBoardHelper
  def render_piece (current_game, column_position, row_position)
        piece = current_game.pieces.where(column_position: column_position, row_position: row_position).first
        if piece != nil
          return "#{piece.color} #{piece.type}"
        else 
          return nil
        end
  end
end
