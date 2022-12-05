require_relative './utils'

test = false
day = '05'
arr = create_array(file_path(day, test))

# "    [D]",
# "[N] [C]",
# "[Z] [M] [P]
# "1   2   3"

# [
#   "    [D]",
#   "[N] [C]",
#   "[Z] [M] [P]",
#   "1   2   3"
# ]

i = 0
i += 1 while arr[i] != ''

instructions = arr[i+1...arr.length]
arr = arr[0...i]

count = arr.pop

containers = Array.new(count[-1].to_i)
containers.map! { |a| [] }

while !arr.empty? do
  row = arr.pop
  c = 0
  i = 0

  while i < row.length
    if row[i] == '['
      containers[c] << row[i+1]
    end
      c += 1
      i += 4
  end
end

instructions.map! do |str|
  result = (/move (\d*) from (\d*) to (\d*)/).match(str)
  result.captures.map(&:to_i)
end

instructions.each do |move|
  count, start, finish = move

  count.times do
    containers[finish - 1] << containers[start - 1].pop
  end

end

result = ""

containers.each { |s| result << s[-1] }

p result
