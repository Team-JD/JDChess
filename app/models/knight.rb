class Knight < Piece  
    def valid_move?(curr_loc,dest_loc)
        current_point = Point.from_location(curr_loc)
        destination_point = Point.from_location(dest_loc)

        if destination_point.x === current_point.x + 1 && destination_point.y === current_point.y + 2 
            return true
        end
        if destination_point.x === current_point.x - 1 && destination_point.y === current_point.y - 2 
                return true
        end
        if destination_point.x === current_point.x - 1 && destination_point.y === current_point.y + 2 
            return true
        end
        if destination_point.x === current_point.x + 1 && destination_point.y === current_point.y - 2 
            return true
        end
        if destination_point.x === current_point.x + 2 && destination_point.y === current_point.y + 1 
            return true
        end
        if destination_point.x === current_point.x - 2 && destination_point.y === current_point.y - 1 
                return true
        end
        if destination_point.x === current_point.x - 2 && destination_point.y === current_point.y + 1 
            return true
        end
        if destination_point.x === current_point.x + 2 && destination_point.y === current_point.y - 1 
            return true
        end
        return false
    end
end