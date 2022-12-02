require_relative './utils'

test = false
day = '02'
arr = create_array(file_path(day, test))

arr.map! { |s| s.split(' ') }

beats = {
  'X' => 'C',
  'Y' => 'A',
  'Z' => 'B',
}

draws = {
  'X' => 'A',
  'Y' => 'B',
  'Z' => 'C',
}

points = {
  'X' => 1,
  'Y' => 2,
  'Z' => 3,
}

# Part 1

total = 0

arr.each do |fight|
  result = 0
  if beats[fight[1]] == fight[0]
    result = 6
  elsif draws[fight[1]] == fight[0]
    result = 3
  end

  total += (result + points[fight[1]])
end

p total

# Part 2

outcomes = {
  'A' => {
    'X' => 'Z',
    'Y' => 'X',
    'Z' => 'Y',
  },
  'B' => {
    'X' => 'X',
    'Y' => 'Y',
    'Z' => 'Z',
  },
  'C' => {
    'X' => 'Y',
    'Y' => 'Z',
    'Z' => 'X',
  }
}

results = {
  'X' => 0,
  'Y' => 3,
  'Z' => 6,
}

total = 0

arr.each do |fight|
  choice = points[outcomes[fight[0]][fight[1]]]

  total += (choice + results[fight[1]])
end

p total
