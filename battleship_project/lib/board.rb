class Board
  def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N) }
    @size = n*n
  end

  attr_reader :size

  def [](pos)
    @grid[ pos[0] ][ pos[1] ]
  end

  def []=(pos, val)
    @grid[ pos[0] ][ pos[1] ] = val
  end

  def num_ships
    # count number of ':S's in the grid
    ct = 0
    @grid.each do |row|
        ct += row.count { |ele| ele == :S }
    end
    ct
  end

  def attack(pos)
    if self[pos] == :S  # if there is a ship in this location
        self[pos] = :H  # mark as 'hit'
        puts 'you done sunk my battleship!'
        return true
    else
        self[pos] = :X
        return false
    end
  end

  def place_random_ships
    quarter = size / 4
    ships_set = 0
    while ships_set < quarter
        # random row
        rand_row = rand(0...@grid.length)

        # random col
        rand_col = rand(0...@grid.length)

        # set random location to a ship
        if self[[rand_row, rand_col]] == :N
            self[[rand_row, rand_col]] = :S
            ships_set += 1
        end
    end
  end

  def hidden_ships_grid
    new_grid = []
    @grid.each do |row|
        new_row = []
        row.each do |spot|
            if spot == :N || spot == :S
                new_row << :N
            elsif spot == :X
                new_row << :X
            elsif spot == :H
                new_row << :H
            end
        end
        new_grid << new_row
    end
    new_grid
  end

  def self.print_grid(grid)
    (0...grid.length).each do |row_ind|
        (0...grid[row_ind].length-1).each do |col_ind|
            spot = grid[row_ind][col_ind]
            print "#{spot} "
        end
        print grid[row_ind][-1]
        puts
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    # cheat
    # puts
    Board.print_grid(hidden_ships_grid)
  end

end
