require_relative'pieces'

class Board
    attr_accessor :board 

    def initialize
        @board = Array.new(8) { Array.new(8) }
        i = 0
        while i < 8 
            @board[1][i] = Pieces.new(:P)
            i += 1
        end
        i = 0
        while i < 8 
            @board[6][i] = Pieces.new(:P)
            i += 1
        end
        @board[0][4] = Pieces.new(:K)
        @board[7][4] = Pieces.new(:K)
        @board[0][3] = Pieces.new(:Q)
        @board[7][3] = Pieces.new(:Q)
        @board[7][1] = Pieces.new(:N)
        @board[7][6] = Pieces.new(:N)
        @board[7][2] = Pieces.new(:B)
        @board[7][5] = Pieces.new(:B)
        @board[7][0] = Pieces.new(:R)
        @board[7][7] = Pieces.new(:R)
        @board[0][1] = Pieces.new(:N)
        @board[0][6] = Pieces.new(:N)
        @board[0][2] = Pieces.new(:B)
        @board[0][5] = Pieces.new(:B)
        @board[0][0] = Pieces.new(:R)
        @board[0][7] = Pieces.new(:R)
    end

    def [](position)
        row = position[0]
        col = position[1]
        @board[row][col]
    end

    def []=(position, value)
        row, col = position
        @board[row][col] = value
    end

    def valid_pos?(pos)
        self[pos] != nil
    end

    def move_piece(start_pos, end_pos)
        if valid_pos?(start_pos) 
            current_piece = self[start_pos]
            self[end_pos] = current_piece
            self[start_pos] = nil
        else 
            raise 'Not a valid position'
        end
    end


end
