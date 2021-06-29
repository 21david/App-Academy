require_relative 'card'

class Board
    def initialize(n)
        @grid = Array.new(n) { Array.new(n, ' ') }
    end

    def populate
        alphabet = ('A'..'Z').to_a
        pairs = @grid.flatten.length / 2
        card_values = []
        pairs.times { Card.new(alphabet.sample) }
    end

end