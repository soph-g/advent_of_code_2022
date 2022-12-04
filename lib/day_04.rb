require_relative './utils'

test = false
day = '04'
arr = create_array(file_path(day, test))

arr.map! { |str| str.split(',').map! { |s| s.split('-') } }

# Part 1
count = 0
result = []

arr.each do |pairs|
  x = pairs[0]
  y = pairs[1]

  first, second = x[0].to_i <= y[0].to_i ? [x, y] : [y, x]
  first, second = first[0] == second[0] && first[1].to_i < second[1].to_i ? [second, first] : [first, second]

  if first[1].to_i >= second[1].to_i
    result << pairs
    count += 1
  end
end

p count

# Part 2

count = 0

arr.each do |pairs|
  x = pairs[0].map { |s| s.to_i }
  y = pairs[1].map { |s| s.to_i }

  if x[0] >= y[0] && x[0] <= y[1]
    count += 1
  elsif x[1] >= y[0] && x[1] <= y[1]
    count += 1
  elsif y[0] >= x[0] && y[0] <= x[1]
    count += 1
  elsif y[1] >= x[0] && y[1] <= x[1]
    count += 1
  end
end

p count
