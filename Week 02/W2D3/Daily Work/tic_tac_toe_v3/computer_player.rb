class ComputerPlayer
    attr_reader :mark

    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position(legal_positions)
        random = legal_positions.sample
        puts "Computer #{@mark} chose position [#{random[0]}, #{random[1]}]."
        [random[0] - 1, random[1] - 1]
    end

end