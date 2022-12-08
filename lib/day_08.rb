require_relative './utils'

test = false
day = '08'
input = create_array(file_path(day, test))

=begin
30373
25512
65332
33549
35390

- from a tree, work in each direction until you find either:
   - a tree that is the same height or higher (stop and change direction)
   - Or the edge (add to the visible count)

- if there is a 0 index in the starting position, then the tree is visible

- Directions are
  - north (y - 1)
  - south (y + 1)
  - east (x - 1)
  - west (x + 1)

- meeting the edge means that the variable being changed == -1
=end

input.map! { |l| l.split('').map! { |c| c.to_i }}

visible_count = 0
visible_matrix = []
input.size.times do
  visible_matrix << Array.new(input[0].size, 0)
end

start_y = 0
while start_y < input.size do
  start_x = 0
  while start_x < input.first.size do
    stop = false
    [:north, :south, :east, :west].each do |dir|
      next if stop
      y = start_y
      x = start_x
      tree = input[y][x]

      case dir
      when :north
        y -= 1 while y - 1 >= 0 && input[y - 1][x] < tree
      when :south
        y += 1 while y + 1 < input.size && input[y + 1][x] < tree
      when :east
        x += 1 while x + 1 < input[0].size && input[y][x + 1] < tree
      when :west
        x -= 1 while x - 1 >= 0 && input[y][x - 1] < tree
      end

      if x == 0 || y == 0 || x == input[0].size - 1 || y == input.size - 1
        visible_matrix[start_y][start_x] = 1
        visible_count += 1
        stop = true
      end
    end
    start_x += 1
  end
  start_y += 1
end

p visible_count

# visible_matrix.map { |l| l.map { |i| i.to_s }.join }.each { |l| p l }
