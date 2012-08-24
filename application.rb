
class Puzzle

  attr_reader :grid

  SOLVED = [
    [1,2,3,4],
    [5,6,7,8],
    [9,10,11,12],
    [13,14,15,0]
  ].freeze

  DIRECTIONS = [:up,:down,:left,:right].freeze

  def initialize
    @grid, @cur_row, @cur_col = SOLVED, 3, 3
    1000.times { move!(DIRECTIONS[rand(4)]) }
  end

  def solved?
    @grid == SOLVED
  end

  def move!(direction)
    case direction
    when :up
      swap!(-1, 0) if @cur_row > 0
    when :down
      swap!(+1, 0) if @cur_row < 3
    when :left
      swap!(0, -1) if @cur_col > 0
    when :right
      swap!(0, +1) if @cur_col < 3
    end
  end

  private

  def swap!(row_mod, col_mod)
    new_row, new_col = @cur_row + row_mod, @cur_col + col_mod
    @grid[new_row][new_col], @grid[@cur_row][@cur_col] = @grid[@cur_row][@cur_col], @grid[new_row][new_col]
    @cur_row, @cur_col = new_row, new_col
  end


end

puzzle = Puzzle.new
print puzzle.grid, "\n"
#puzzle.move(:up)
#print puzzle.grid, "\n"
#puzzle.move(:down)
#print puzzle.grid, "\n"
#print puzzle.solved?, "\n"
