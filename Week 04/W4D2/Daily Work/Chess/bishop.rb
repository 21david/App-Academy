require_relative 'slideable.rb'
require_relative 'piece.rb'
require_relative 'board.rb'

class Bishop < Piece

    include Slideable

    def initialize(color, board, pos)
        @color, @board, @pos = color, board, pos
    end

    private

    def move_dirs
        dir = [:diagonal]
    end
    
end

# debugger
board = Board.new
bishop = Bishop.new(:black, board, [4,4])
board[[4,4]] = bishop
p bishop.moves