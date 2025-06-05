require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
    def initialize(size, hash)
        # each player needs to be initialized as a Player object
        @players = Array.new(hash.keys.length) 

        # initialize a player for each spot in the array with the corresponding symbol
        # if the value is true, initialize a ComputerPlayer
        # if it is false, initialize a HumanPlayer
        i = 0
        hash.each do |symbol, computer|
            if computer
                @players[i] = ComputerPlayer.new(symbol) 
            else
                @players[i] = HumanPlayer.new(symbol) 
            end
            i += 1
        end

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
            puts "==========================================="
            chosen_pos = @cur_player.get_position(@board.legal_positions)
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