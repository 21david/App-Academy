require_relative 'card'

class Board
    def initialize(n)
        @grid = Array.new(n) { Array.new(n, ' ') }
    end

    def populate
        alphabet = ('A'..'Z').to_a
        pairs = @grid.flatten.length / 2
        card_values = []

        pairs.times do 
            letter = alphabet.sample
            while card_values.include?(letter)
                letter = alphabet.sample
            end 
    
            card_values << letter  #card_values works, it returns 8 random pairs
        end 

        card_values.each do |letter|
            position = get_random_position
            while @grid[position] == " "
                

        end 


    end

    def get_random_position
        rand_row = rand(0...@grid.length)
        rand_col = rand(0...@grid.length)
        position = [rand_row, rand_col]
    end 


    def [](position)
        r,c = position 
        @grid[r][c]
    end 

    def []=(position, value)
        r,c = position
        @grid[r][c] = value
    end 

end