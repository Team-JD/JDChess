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
        puts "initialize_board #{id}"

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
<<<<<<< Updated upstream
  end
    
    
  def is_obstructed(curr_loc,dest_loc)
    pieces_location = []
    current_point = Point.from_location(curr_loc)
    destination_point = Point.from_location(dest_loc)

    if current_point == nil || destination_point == nil
        return false
    end
    
    deltaX = destination_point.x - current_point.x
    deltaY = destination_point.y - current_point.y
    xStep = deltaX == 0 ? 0 : deltaX > 0 ? 1 : -1
    yStep = deltaY == 0 ? 0 : deltaY > 0 ? 1 : -1

    current_point.x += xStep;
    current_point.y += yStep;
    
    pieces_location << pieces.pluck(:location)
    

    while(current_point.x  != destination_point.x || current_point.y != destination_point.y)
        if pieces_location[0].include?("#{current_point.to_location}") 
            return false
        end
        current_point.x += xStep;
        current_point.y += yStep;
        
        if current_point.x.abs > 8 || current_point.x < 1|| current_point.y.abs > 8 || current_point.y < 1
            return false
        end

        
    end

      
    return true
=======
>>>>>>> Stashed changes
  end
    
    
  def is_obstructed(curr_loc,dest_loc)
    pieces_location = []
    current_point = Point.from_location(curr_loc)
    destination_point = Point.from_location(dest_loc)

    if current_point == nil || destination_point == nil
        return false
    end
    
    deltaX = destination_point.x - current_point.x
    deltaY = destination_point.y - current_point.y
    xStep = deltaX == 0 ? 0 : deltaX > 0 ? 1 : -1
    yStep = deltaY == 0 ? 0 : deltaY > 0 ? 1 : -1

    current_point.x += xStep;
    current_point.y += yStep;
    
    pieces_location << pieces.pluck(:location)
    

    while(current_point.x  != destination_point.x || current_point.y != destination_point.y)
        if pieces_location[0].include?("#{current_point.to_location}") 
            return false
        end
        current_point.x += xStep;
        current_point.y += yStep;
        
        if current_point.x.abs > 8 || current_point.x < 1|| current_point.y.abs > 8 || current_point.y < 1
            return false
        end

        
    end

      
    return true
  end
end
