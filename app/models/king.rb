class King < Piece  
    def valid_move?(curr_loc,dest_loc)
        current_point = Point.from_location(curr_loc)
        destination_point = Point.from_location(dest_loc)

        if (destination_point.y - current_point.y).abs == 1 && (destination_point.x - current_point.x).abs == 1
            return true
        end
        if (destination_point.y == current_point.y - 1 && destination_point.x == current_point.x) || (destination_point.y == current_point.y + 1 && destination_point.x == current_point.x) 
            return true
        end
        if(destination_point.x == current_point.x - 1 && destination_point.y == current_point.y) || (destination_point.x == current_point.x + 1 && destination_point.y == current_point.y )
            return true
        end
        return false
    end 
end