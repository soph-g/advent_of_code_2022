require_relative './utils'

test = false
day = '07'
input = create_array(file_path(day, test))

input.map! { |s| s.split(' ') }

=begin
1. create a stack of the current location
2. for each file/directory in the current location:
a) add directories to the totals hash (default 0)
b) add the file size to the totals for each of the items in the directory stack

navigation:
 '$' indicates instruction
 cd .. -> pop a directory off the stack
 cd '/' -> replace the stack with a new one, containing just the route directory
 cd 'x' -> add 'x' to the current stack

ls -> do nothing

stack
['/']
['/', 'plws']
['/', 'plws', 'ffpzc']
['/', 'plws', 'frcmjzts', 'bsltmjz']
['/', 'plws', 'frcmjzts']
['/', 'phqcg']
This is where I went wrong! Needed to have a unique path as each individual key in my totals. This approach meant that the same directory name could appear in two different paths, and I would only be counting a single total. Whoops!
=end

class Navigator
  attr_reader :totals, :stack

  AVAILABLE_SPACE = 70000000
  REQUIRED_SPACE = 30000000

  def initialize
    @stack = []
    @unique_key = []
    @totals = Hash.new(0)
    @to_delete = 0
  end

  def read_lines(input)
    input.each do |line|
      if line[0] == '$'
        handle_instruction(line)
      elsif line[0] != 'dir'
        update_totals(line)
      end
    end

    totals
  end

  def update_totals(file)
    @stack.each do |dir|
      @totals[dir] += file[0].to_i
    end
  end

  def handle_instruction(line)
    return if line[1] == 'ls'

    if line[2] == '/'
      @stack = ['/']
    elsif line[2] == '..'
      @unique_key.pop
      @stack.pop
    else
      @unique_key << line[2]
      @stack << @unique_key.join('/')
    end
  end

  def fetch_totals(max)
    sum = 0
    totals.values.each do |total|
      sum += total if total <= max
    end
    sum
  end

  def to_delete
    current_available = AVAILABLE_SPACE - @totals['/']
    REQUIRED_SPACE - current_available
  end

  def find_smallest_directory
    smallest = Float::INFINITY

    totals.values.each do |val|
      if val > to_delete
        smallest = val if val < smallest
      end
    end

    smallest
  end
end

# Part 1

nav = Navigator.new
nav.read_lines(input)
p nav.fetch_totals(100000)

# Part 2

nav = Navigator.new
nav.read_lines(input)
p nav.find_smallest_directory
