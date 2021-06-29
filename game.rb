require_relative 'card'
require_relative 'board'

class Game
    def initialize(n)
        @board = Board.new(n)
        @position = [0,0]
    end

    def play
        while !won?
            @board.render
            print "Enter a guess: "
            response = gets.chomp.split(' ')
            guess1 = response.map { |coordinate| coordinate.to_i }
            print "Enter a second guess: "
            response2 = gets.chomp.split(' ')
            guess2 = response.map { |coordinate| coordinate.to_i }
            self.make_guess(guess1, guess2)
        end

    end

    def make_guess(guess1, guess2)
        card1 = @board[guess1]
        card2 = @board[guess2]
        if card1.value == card2.value
            @board.reveal(guess1)
            @board.reveal(guess2)

    end

end