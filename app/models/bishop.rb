class Bishop < Piece  
    def valid_move?(curr_loc,dest_loc)
        current_point = Point.from_location(curr_loc)
        destination_point = Point.from_location(dest_loc)

        if (current_point.y - destination_point.y).abs == (current_point.x - destination_point.x).abs
            return true
        else
            return false
        end
    end 
end