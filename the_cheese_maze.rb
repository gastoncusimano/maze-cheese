# Set Maze configuration
$maze = [['⬜', '⬜', '⬜', '⬜', '⬛'],
         ['⬜', '⬛', '⬛', '⬜', '⬜'],
         ['⬜', '⬜', '⬜', '⬜', '⬜'],
         ['⬛', '⬜', '⬜', '⬛', '⬜'],
         ['⬛', '⬜', '⬛', '⬛', '⬛']]
# => Both expressed as an array, first value row number, second value column number.
$mouse_pos = [0, 1]
$cheese_pos = [4, 0]

class TheCheeseMaze
  def initialize(params)
    @maze = params[:maze]
    @rows = @maze.length
    @cols = @maze[0].length
    @mouse_pos = params[:mouse_pos]
    @cheese_pos = params[:cheese_pos]
    @dup_maze = @maze
  end

  def solve(shortest_path: false, visual: false)
    # Display initial maze
    show_maze if visual

    # Basic declaration
    @queue = [@mouse_pos]
    @visited = {}
    @visited[@mouse_pos] = nil

		# Choose algorithm
		path = cheese_finder(shortest_path)
    return show_maze(path: path) if visual

    path ? path : 'Path not found or possible'
  end

  private
  def cheese_finder(shortest_path)
    while @queue.any?
      current = shortest_path ? @queue.shift : @queue.pop
      return get_path(@visited, @mouse_pos, @cheese_pos) if current == @cheese_pos
     # Check directions
      neighbors(current).each do |cell|
        next if @visited.key?(cell)

        @visited[cell] = current
        @queue.push(cell)
      end
    end
    nil
  end

  # Helper to check all directions
  def neighbors(coord)
    row, col = coord
    neighbors = []

    # Up
    neighbors.push([row - 1, col]) if row > 0 && !wall?([row - 1, col])
    # Down
    neighbors.push([row + 1, col]) if row < @rows - 1 && !wall?([row + 1, col])
    # Left
    neighbors.push([row, col - 1]) if col > 0 && !wall?([row, col - 1])
    # Right
    neighbors.push([row, col + 1]) if col < @cols - 1 && !wall?([row, col + 1])

    neighbors
  end

  # Helper validation if the pos is wall
  def wall?(coord)
    row, col = coord
    @maze[row][col] == '⬛'
  end

  # Return path
  def get_path(visited, start, finish)
    path = [finish]
    current = finish

    # Build the path prepending the point
    while current != start
      current = visited[current]
      path.unshift(current)
    end

    path
  end

  # Visual maze on console
  def show_maze(path: [])
    if path.present?
      path[1..-2].map do |pos|
        @dup_maze[pos[0]][pos[1]] = '🟩'
      end
    end
    @dup_maze[@mouse_pos[0]][@mouse_pos[1]]   = '🐭' if @dup_maze[@mouse_pos[0]][@mouse_pos[1]]   !=  '🐭'
    @dup_maze[@cheese_pos[0]][@cheese_pos[1]] = '🧀' if @dup_maze[@cheese_pos[0]][@cheese_pos[1]] !=  '🧀'

    time_text = path.present? ? 'path for the' : "initial"
    arr_maze = @dup_maze.map do |row|
      row.join('')
    end
  
    puts ""
    puts "The #{time_text} maze looks like this:"
    puts ""
    puts arr_maze
    puts ""
    path.present? ? path : "Path not found or possible"
  end
end
