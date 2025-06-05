require_relative 'board'
require_relative 'human_player'

# Points for improvement:
#  - execution stops if user accidentally enters bad input

class Game
    def initialize(p1, p2)
        @p1 = HumanPlayer.new(p1)
        @p2 = HumanPlayer.new(p2)
        @board = Board.new
        @cur_player = @p1
    end

    def switch_turn
        if @cur_player == @p1
            @cur_player = @p2
        else
            @cur_player = @p1
        end
    end

    def play
        while @board.empty_positions?
            @board.print_board
            chosen_pos = @cur_player.get_position
            cur_player = @cur_player.mark
            @board.place_mark(chosen_pos, cur_player)
            if @board.win?(cur_player)
                puts "#{cur_player} WON!!!"
                return
            else
                switch_turn
            end
        end

        # if while loop finished and no one one, that means
        # we ran out of empty positions, so it is a draw
        @board.print_board
        puts "No one won -- it was a draw."
    end

end