


class Hanoi
    @@solution = [1,2,3]
    def self.solution
        @@solution
    end
    attr_accessor :board
    def initialize
        @board = [Hanoi.solution, [], []]
    end
    

    def [](pos)
        row, col = pos
        @board[row][col]
    end

    def []=(pos,val)
        row, col = pos
        @board[row][col] = val
    end

    def print_board
        p @board
    end

    def move_piece(move) #stacks [0,1]
        # p move[0]
        # p move[1]
        if valid_move?(move[0],move[1])
            @board[move[1]].unshift(@board[move[0]].shift)
            return true
        else
            puts "NOT A VALID MOVE"
            return false
        end 
    end

    def valid_move?(start_stack, end_stack) #[0,1] @board[0]
        return true if @board[end_stack].empty?
        return false if @board[end_stack].first < @board[start_stack].first
        true
    end

    def won?
        if @board[2] == Hanoi.solution
            puts 'Winner!!'
            return true
        else
            return false
        end
    end

    def valid_input(move) #array [0,1]
      start_stack,end_stack = move
      return false if @board[start_stack].nil? || @board[end_stack].nil?        
      true
    end
 
    def get_move
        puts "Where you want to move from and to"
        input = gets.chomp.split(',').map(&:to_i) #[0,',',1]
        
        until valid_input(input)
            puts"NOT VALID MOVE, RETRY"
            get_move
        end        
        input
    end

    def reset
        @board = [[1,2,3],[],[]]
    end

    def play
        print_board
        move = get_move 
        # p move
        move_piece(move)
        until won?
            play
        end
        puts "Ready for a new game?"
        reset
    end
end

# g = Hanoi.new
# p g.print_board
# g.get_move



# def get_move
#     puts "Where you want to move from and to"
#     input = gets.chomp.split(',').map(&:to_i) #[0,',',1]
    
#     until valid_input(input)
#         puts"NOT VALID MOVE, RETRY"
#         get_move
#     end        
#     input
# end
# ----------------------------------
# def valid_move?(start_stack, end_stack) #[0,1] @board[0]
#     return true if @board[end_stack].empty?
#     return false if @board[end_stack].first < @board[start_stack].first
#     true
# end
# -------------------------
# def play
#     print_board
#     move = get_move 
#     # p move
#     move_piece(move)
#     print_board
#     until won?
#         play
#     end
#     --------------
#     def valid_input(move) #array [0,1]
#         start_stack,end_stack = move
#         return false if @board[start_stack].nil? || @board[end_stack].nil?        
#         true
#       end