class Queen < Piece  
    def valid_move?(curr_loc,dest_loc)
        current_point = Point.from_location(curr_loc)
        destination_point = Point.from_location(dest_loc)

        if (destination_point.y - current_point.y).abs == (destination_point.x - current_point.x).abs || (current_point.x == destination_point.x || current_point.y == destination_point.y)
            return true
        else
            return false
        end
    end
end