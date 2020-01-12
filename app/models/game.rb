class Game < ActiveRecord::Base
    has_many :users
    has_many :pieces
      after_create :initialize_board!
  def initialize_board!
    #white
    (0..7).each do |i|
      Pawn.create(
        game_id: id,
        row_position: i,
        column_position: 1,
        color: "W"
        )
    end

    Rook.create(game_id: id, row_position: 0, column_position: 0, color: "W")
    Rook.create(game_id: id, row_position: 7, column_position: 0, color: "W")

    Knight.create(game_id: id, row_position: 1, column_position: 0, color: "W")
    Knight.create(game_id: id, row_position: 6, column_position: 0, color: "W")

    Bishop.create(game_id: id, row_position: 2, column_position: 0, color: "W")
    Bishop.create(game_id: id, row_position: 5, column_position: 0, color: "W")

    Queen.create(game_id: id, row_position: 3, column_position: 0, color: "W")
    King.create(game_id: id, row_position: 4, column_position: 0, color: "W")

    #black
    (0..7).each do |i|
      Pawn.create(
        game_id: id,
        row_position: i,
        column_position: 6,
        color: "B"
        )
    end

    Rook.create(game_id: id, row_position: 0, column_position: 7, color: "B")
    Rook.create(game_id: id, row_position: 7, column_position: 7, color: "B")

    Knight.create(game_id: id, row_position: 1, column_position: 7, color: "B")
    Knight.create(game_id: id, row_position: 6, column_position: 7, color: "B")

    Bishop.create(game_id: id, row_position: 2, column_position: 7, color: "B")
    Bishop.create(game_id: id, row_position: 5, column_position: 7, color: "B")

    Queen.create(game_id: id, row_position: 3, column_position: 7, color: "B")
    King.create(game_id: id, row_position: 4, column_position: 7, color: "B")
  end

  def render_piece (current_game, row_position, column_position)
        game = Game.find(current_game.id)
        piece = game.find_by(row_position: row_position, column_position: column_position)
        piece.type
  end
end
