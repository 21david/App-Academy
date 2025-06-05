require_relative 'slideable.rb'
require_relative 'piece.rb'
require_relative 'board.rb'

require 'byebug'

class Rook < Piece

    include Slideable

    def initialize(color, board, pos)
        @color, @board, @pos = color, board, pos
    end

    private

    def move_dirs
        dir = [:horizontal]
    end

end

# debugger
board = Board.new
rook = Rook.new(:black, board, [4,4])
board[[4,4]] = rook
p rook.moves