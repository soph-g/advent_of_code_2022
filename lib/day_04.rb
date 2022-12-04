require_relative './utils'

test = true
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
