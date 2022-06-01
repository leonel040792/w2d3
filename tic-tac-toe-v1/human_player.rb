class HumanPlayer

    attr_reader :mark_value
    def initialize(mark_value)
        @mark_value = mark_value

    end

    def get_position
            p "Please, player #{self.mark_value} enter a position inside brackets and separated with commas, like `a b` a and b being integers"
            pos= gets.chomp.split(" ")
            raise "too many numbers. We only need two" if pos.length !=2
            pos.map!(&:to_i)

    end






end
