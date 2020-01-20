class Point 
    attr_accessor :x, :y

    def initialize(x = 0, y = 0) 
        @x = x
        @y = y
    end

    def to_location
      x_table = ["", "A", "B", "C", "D", "E", "F", "G", "H"]
      return "#{x_table[@x]}#{@y}"
    end

    def is_vertical(destination)
      return @x == destination.x
    end

    def is_horizontal(destination)
        return @y == destination.y
    end
  
    def self.from_location(location)
        x_table = {"A" => 1,"B" => 2,"C" => 3,"D" => 4,"E" => 5,"F" => 6,"G" => 7,"H" => 8}
        if x_table[location.split("")[0]] == nil || location.split("")[1].to_i < 0 || location.split("")[1].to_i > 8
          return nil
        else
          x_location = x_table[location.split("")[0]]
          y_location = location.split("")[1].to_i

          return new(x_location, y_location)
        end
    end

end