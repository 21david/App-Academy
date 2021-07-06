require_relative 'slideable.rb'
require_relative 'piece.rb'
require_relative 'board.rb'

class Queen < Piece

    include Slideable

    def initialize(color, board, pos)
        @color, @board, @pos = color, board, pos
    end

    private

    def move_dirs
        dir = [:horizontal, :diagonal]
    end
    
end

board = Board.new
queen = Queen.new(:black, board, [4,4])
board[[4,4]] = queen
p queen.moves