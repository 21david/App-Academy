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
    end

    def move_dirs
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        new_pos = []
        new_pos << @pos[0] + dy
        new_pos << @pos[1] + dx
        new_pos
    end
end