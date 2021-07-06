module Slideable

    HORIZONTAL_DIRS = [[0,1], [0,-1], [1,0], [-1,0]]
    DIAGONAL_DIRS = [[1,1], [1,-1], [-1,1], [-1,-1]]

    def moves
        possible_moves = []
        
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        new_pos = []
        new_pos << @pos[0] + dy
        new_pos << @pos[1] + dx
        new_pos
    end
end