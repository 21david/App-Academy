require_relative 'card'
require_relative 'board'

class Game
    attr_reader :board, :position

    def initialize(n)
        @board = Board.new(n)
        @position = [0,0]
    end

    def play
        while !@board.won?
            print "Enter a guess: "
            response = gets.chomp.split(' ')
            guess1 = response.map { |coordinate| coordinate.to_i }
            @board.reveal(guess1)
            @board.render(guess1)
            print "Enter a second guess: "
            response2 = gets.chomp.split(' ')
            guess2 = response.map { |coordinate| coordinate.to_i }
            @board.reveal(guess2)
            @board.render(guess2)
            self.make_guess(guess1, guess2)
        end

    end

    def make_guess(guess1, guess2)
        card1 = @board[guess1]
        card2 = @board[guess2]
        is_match = card1.value == card2.value

        if is_match
            print "Congrats! You found a match"
            return 
        else  
            card1.hide 
            card2.hide
        end 
    end

end