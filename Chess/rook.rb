require_relative 'slideable.rb'
require_relative 'piece.rb'
require_relative 'board.rb'


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

rook = Rook.new(:black, Board.new, [0,0])
p rook.moves