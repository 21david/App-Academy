class Board
    def initialize(n=3)
        @grid = Array.new(n) { Array.new(n, '_') }
    end

    def valid?(pos)
        !(pos[0] < 0 || pos[0] >= @grid.length || pos[1] < 0 || pos[1] >= @grid[0].length)
    end

    def empty?(pos)
        raise "invalid position!" if !valid?(pos)
        @grid[ pos[0] ][ pos[1] ] == '_'
    end

    def place_mark(pos, mark)
        raise "invalid position!" if !valid?(pos)
        raise "position not empty!" if !empty?(pos)
        @grid[ pos[0] ][ pos[1] ] = mark
    end

    # print the grid
    def print_board
        (0...@grid.length).each do |row_i|
            (0...@grid[row_i].length-1).each do |col_i|
                print "#{@grid[row_i][col_i]} "
            end
            print @grid[row_i][-1]
            puts
        end
    end

    def win_row?(mark)
        # check each row
        full_row = true
        @grid.each do |row|
            full_row = true
            row.each do |ele|
                full_row &= (ele == mark)  # if one !=, full_row becomes false
            end
            return true if full_row
            full_row = true
        end
        false  # return false after searching every row
    end

    def win_col?(mark)
        # check each col
        full_col = true
        cols = @grid[0].length
        (0...cols).each do |col_i|
            full_col = true
            @grid.each do |row|
                full_col &= row[col_i] == mark
            end
            # after checking the same index on all rows, full_col is either true or false
            return true if full_col
            full_col = false
        end
        false  # return false after searching every column
    end

    def win_diagonal?(mark)
        # check negative slope diagonal
        ns_diag = true
        (0...@grid.length).each do |i|
            ns_diag &= (@grid[i][i] == mark)
        end
        return true if ns_diag

        # check positive slope diagonal
        ps_diag = true
        (0...@grid.length).each do |i|
            ps_diag &= (@grid[i][-1-i] == mark)
        end
        return true if ps_diag

        false
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.any? { |row| row.any? { |ele| ele == '_'}}
        
        # @grid.each do |row|
        #     row.each do |ele|
        #         return true if ele == '_'
        #     end
        # end
        # false
    end

end