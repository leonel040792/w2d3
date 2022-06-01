class Board

    def self.print_grid(arr)
        arr.each {|row| puts row.join(" ")}

    end


    attr_reader :size
    def initialize(n)
        @grid=Array.new(n){Array.new(n,:N)}
        @size= n*n
    end

    def [](array)
        @grid[array[0]][array[1]]
    end

    def []=(position, val)
        @grid[position[0]][position[1]]=val
    end

    def num_ships
        @grid.sum {|subarray| subarray.count(:S)}
    end

    def attack(position)
        if self[position]==:S 
            self[position]=:H 
            p 'you sunk my battleship!'
            return true
        else 
            self[position]=:X 
            return false
        end
    end

    def place_random_ships
        until @grid.sum{|subarray| subarray.count(:S)} == (@size*0.25).to_i
            @grid[rand(0...@grid.length)][rand(0...@grid[0].length)]=:S
        end
    end

    def hidden_ships_grid
        arr= @grid.map{|subarray| subarray.map{|ele| ele==:S ? :N : ele}}
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end


end
