class HumanPlayer
    attr_reader :mark

    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position
        puts "=========== Current player: #{@mark} ============="
        puts 'Enter a position like `2 3` (row and column):'
        input = gets.chomp
        input_arr = input.split
        raise "Sorry, that was invalid." if input_arr.length > 2

        # subtracting by 1 to adjust for 0-based indexing
        input_arr_ints = [ input_arr[0].to_i - 1, input_arr[1].to_i - 1]
    end

end