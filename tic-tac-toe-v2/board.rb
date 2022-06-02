class Board
    
    def initialize(n)
        @grid=Array.new(n){Array.new(n,"_")}
    end


    def valid?(position)
        position[0].between?(0,@grid.length-1) && position[1].between?(0,@grid.length-1)
        
    end

    def empty?(position)
        @grid[position[0]][position[1]]=="_"
    end

    def place_mark(position, mark)
         if valid?(position) && empty?(position) 
            @grid[position[0]][position[1]]=mark 
         else 
            raise ArgumentError.new ("Invalid Mark")
         end
    end

    def print
        puts "==============================="
        @grid.each {|row| puts row.join(" ")}
        puts "==============================="
    end

    def win_row?(mark)
        @grid.any?{|row| row.all?(mark)}
    end

    def win_col?(mark)
        @grid.length.times do |i|
            return true if @grid.all?{|row| row[i]==mark}
        end
        false
    end

    def win_diagonal?(mark)

        flag=0
        @grid.each_with_index {|subarray, idx| flag+=1 if subarray[idx]==mark}
        return true if flag==@grid.length


        count=@grid.length-1
        (0...@grid.length).each do |i|
            return false if @grid[i][count]!=mark
            count-=1
        end
        true
    end


    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.any?{|subarray| subarray.include?("_")}
    end

end