require_relative 'piece.rb'

class Board

    def initialize
        # black = Array.new(2) { Array.new(8) { Piece.new(:black) } }
        # null = Array.new(4) { Array.new(8) {nil} }
        # white = Array.new(2) { Array.new(8) { Piece.new(:white) } }
        # @rows = black + null + white
        @rows =  Array.new(8) { Array.new(8) { nil } }
    end

    def [](pos)
        row, col = pos
        @rows[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @rows[row][col] = val
    end

    def move_piece(start_pos, end_pos)
        raise "No piece there!" if self[start_pos] == nil
        raise "Can't move there!" if self[end_pos] != nil
        self[end_pos] = self[start_pos]
        self[start_pos] = nil
    end

end