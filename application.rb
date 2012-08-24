
class Puzzle

  @@Solved = [
    [1,2,3,4],
    [5,6,7,8],
    [9,10,11,12],
    [13,14,15,0]
  ]

  @@Directions = [:up,:down,:left,:right]

  def initialize
    @grid, @row, @col = @@Solved, 3, 3
    1000.times do
      direction = @@Directions[rand(4)]
      move!(direction)
    end
  end

  def grid
    @grid
  end

  def solved?
    @grid == @@Solved
  end

  def move! direction
    case direction
    when :up then
      if @row > 0 then
        swap(@row,@col,@row-1,@col)
        @row -= 1
      end
    when :down then
      if @row < 3 then
        swap(@row,@col,@row+1,@col)
        @row += 1
      end
    when :left then
      if @col > 0 then
        swap(@row,@col,@row,@col-1)
        @col -= 1
      end
    when :right then
      if @col < 3 then
        swap(@row,@col,@row,@col+1)
        @col += 1
      end
    end
  end

  private

  def swap row0,col0,row1,col1
    @grid[row1][col1], @grid[row0][col0] = @grid[row0][col0], @grid[row1][col1]
  end


end

puzzle = Puzzle.new
print puzzle.grid, "\n"
#puzzle.move(:up)
#print puzzle.grid, "\n"
#puzzle.move(:down)
#print puzzle.grid, "\n"
#print puzzle.solved?, "\n"
