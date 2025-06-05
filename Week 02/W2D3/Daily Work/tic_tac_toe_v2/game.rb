require_relative 'board'
require_relative 'human_player'

# Points for improvement:
#  - execution stops if user accidentally enters bad input

class Game
    def initialize(size, *players)
        # each player needs to be initialized as a Player object
        @players = Array.new(players.length) 

        # initialize a player for each spot in the array with the corresponsing symbol
        (0...@players.length).each { |i| @players[i] = HumanPlayer.new(players[i]) }

        @board = Board.new(size)
        @cur_player_num = 0
        @cur_player = @players[@cur_player_num]
    end

    def switch_turn
        @cur_player_num = (@cur_player_num + 1) % @players.length
        @cur_player = @players[@cur_player_num]
    end

    def play
        while @board.empty_positions?
            @board.print_board
            chosen_pos = @cur_player.get_position
            cur_player = @cur_player.mark
            @board.place_mark(chosen_pos, cur_player)
            if @board.win?(cur_player)
                @board.print_board
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