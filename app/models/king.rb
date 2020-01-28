class King < Piece  
    def valid_move?(curr_loc,dest_loc)
        current_point = Point.from_location(curr_loc)
        destination_point = Point.from_location(dest_loc)
        
        return (destination_point.y - current_point.y).abs <= 1 &&
                (destination_point.x - current_point.x).abs <= 1
        
    end 
end