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



=end

class Navigator
  attr_reader :totals

  def initialize
    @stack = []
    @totals = Hash.new(0)
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
      @stack.pop if @stack.size > 1
    else
      @stack << @stack.join('/') + '/' + line[2]
    end
  end

  def fetch_totals(max)
    sum = 0
    totals.values.each do |total|
      sum += total if total <= max
    end
    sum
  end
end

# Part 1

nav = Navigator.new
nav.read_lines(input)
p nav.fetch_totals(100000)
