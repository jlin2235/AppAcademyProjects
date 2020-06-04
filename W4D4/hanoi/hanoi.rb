class Hanoi
    def initialize
        @board = Array.new(3) {Array.new}
        populate
    end
    def populate
        @board[0] = [1,2,3,4]
    end
end



