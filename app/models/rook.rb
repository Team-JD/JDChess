class Rook < Piece  
    def valid_move?(curr_loc,dest_loc)
        current_point = Point.from_location(curr_loc)
        destination_point = Point.from_location(dest_loc)
        
        return current_point.is_horizontal(destination_point) ||
             current_point.is_vertical(destination_point)

    end
end