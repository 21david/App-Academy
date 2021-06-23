class Player
    def get_move
        puts 'enter a position with coordinates separated with a space like `4 7`'
        input = gets.chomp
        input2 = input.split
        [input2[0].to_i - 1, input2[1].to_i - 1]
    end
end
