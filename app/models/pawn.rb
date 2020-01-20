class Pawn < Piece 
    def valid_move?(curr_loc,dest_loc)
        current_point = Point.from_location(curr_loc)
        destination_point = Point.from_location(dest_loc)
        
        pieces_location = game.pieces.map(&:location)
        pieces_color = game.pieces.map(&:color)
        pieces_status = game.pieces.map(&:piece_status)


        if pieces_location.index(curr_loc) !=nil && pieces_status[pieces_location.index(curr_loc)] == "Inactive"
            if current_point.x == destination_point.x || current_point.y == destination_point.y
                if destination_point.y == current_point.y + 1 && (pieces_location.index(curr_loc) !=nil && pieces_color[pieces_location.index(curr_loc)] == "B")|| destination_point.y == current_point.y - 1 && (pieces_location.index(curr_loc) !=nil && pieces_color[pieces_location.index(curr_loc)] == "W")
                    return true
                elsif destination_point.y == current_point.y + 2 && (pieces_location.index(curr_loc) !=nil && pieces_color[pieces_location.index(curr_loc)] == "B")|| destination_point.y == current_point.y - 2 && (pieces_location.index(curr_loc) !=nil && pieces_color[pieces_location.index(curr_loc)] == "W")
                    return true
                end
            end
        end
        if current_point.x == destination_point.x || current_point.y == destination_point.y
            if destination_point.y == current_point.y + 1 && (pieces_location.index(curr_loc) !=nil && pieces_color[pieces_location.index(curr_loc)] == "B")|| destination_point.y == current_point.y - 1 && (pieces_location.index(curr_loc) !=nil && pieces_color[pieces_location.index(curr_loc)] == "W")
                return true
            end
        end
        if pieces_location.include?(dest_loc) != nil && ((pieces_location.index(dest_loc) != nil && pieces_location.index(curr_loc) !=nil) && pieces_color[pieces_location.index(dest_loc)] != pieces_color[pieces_location.index(curr_loc)])
            if (destination_point.y == current_point.y - 1||destination_point.y == current_point.y + 1) && (destination_point.x == current_point.x + 1|| destination_point.x == current_point.x - 1)
                return true
            end   
        end
        return false
    end
end