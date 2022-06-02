require "byebug"
require_relative "board.rb"
require_relative "human_player.rb"

class Game

    def initialize(mark_1, mark_2)
        @grid=Board.new
        @player_1=HumanPlayer.new(mark_1)
        @player_2= HumanPlayer.new(mark_2)
        @current_player=@player_1
    end

    def switch_turn
        @current_player == @player_1 ? @current_player= @player_2 : @current_player = @player_1
    end

    def play
        while @grid.empty_positions?
            @grid.print
            @grid.place_mark(@current_player.get_position, @current_player.mark_value)
            if @grid.win?(@current_player.mark_value)
                return puts "CONGRATULATIONS, YOU WIN"
            else
                self.switch_turn
            end
        end
        puts "DRAW"
    end

end
 