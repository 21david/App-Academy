require_relative 'card'

class Board
    def initialize(n)
        raise "Error: number should be even" if !n.even?
        @grid = Array.new(n) { Array.new(n, '_') }

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
    
            card_values << letter  
        end 

        card_values.each do |letter|
            while @grid.flatten.count(Card.new(letter)) < 2
                position = get_random_position
                if self.[](position) == '_'
                    self.[]=(position, Card.new(letter))
                end
            end
        end

        @grid
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

    def render
        print "  "
        (0...@grid.length).each {|i| print "#{i} "}
        puts 

        @grid.each_with_index do |row, r|
            print "#{r} "
            row.each_with_index do |card, idx|
                print "#{card.value} "
            end
            puts
        end

        nil
    end 

    def won?
        return false if @grid.any? { |row| row.any? {|card| card == "_"} }
        @grid.any? { |row| row.any? {|card| !card.is_face_up} }
    end 

    def reveal(guessed_pos)
        card = self.[](guessed_pos) 

        card.reveal if !card.is_face_up
        
        card.value 
    end 

end