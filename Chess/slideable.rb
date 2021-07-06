module Slideable

    HORIZONTAL_DIRS = [[0,1], [0,-1], [1,0], [-1,0]]
    DIAGONAL_DIRS = [[1,1], [1,-1], [-1,1], [-1,-1]]

    def horizontal_dirs
    end

    def diagonal_dirs
    end
    
    def moves
        possible_moves = []
        dirs = move_dirs
        # make a copy of the position
        # repeatedly call grow_unblocked_moves_in_dir on that position
        pos_copy = @pos.dup

        if dirs.include?(:horizontal)
            HORIZONTAL_DIRS.each do |dir|
                new_pos = grow_unblocked_moves_in_dir(dir[0], dir[1], @pos)
                while (new_pos[0] < 8 && new_pos[1] < 8 && new_pos[0] >= 0 && new_pos[1] >= 0) && @board[new_pos].nil?
                    possible_moves << new_pos
                    new_pos = grow_unblocked_moves_in_dir(dir[0], dir[1], possible_moves[-1])
                    
                end
                if @board[new_pos] != nil && self.color != @board[new_pos].color
                    possible_moves << new_pos
                end
            end
        end

        if dirs.include?(:diagonal)
            DIAGONAL_DIRS.each do |dir|
                new_pos = grow_unblocked_moves_in_dir(dir[0], dir[1], @pos)
                while (new_pos[0] < 8 && new_pos[1] < 8 && new_pos[0] >= 0 && new_pos[1] >= 0) && @board[new_pos].nil?
                    possible_moves << new_pos
                    new_pos = grow_unblocked_moves_in_dir(dir[0], dir[1], possible_moves[-1])
                    
                end
                if @board[new_pos] != nil && self.color != @board[new_pos].color
                    possible_moves << new_pos
                end
            end
        end
        possible_moves
    end

    def move_dirs
    end

    def grow_unblocked_moves_in_dir(dx, dy, pos)
        new_pos = []
        new_pos << pos[0] + dy
        new_pos << pos[1] + dx
        new_pos
    end
end