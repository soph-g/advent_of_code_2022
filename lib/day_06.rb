require_relative './utils'

test = false
day = '06'
arr = create_array(file_path(day, test))

input = arr[0]

# Part 1

start = 0
marker_found = false

while start < input.size - 3 && !marker_found do
  counts = Hash.new(0)
  i = 0

  while i < 4 do
    char = input[start + i]

    if counts[char] == 0
      counts[char] = start + i + 1
      i += 1
    else
      i = 5
      start = counts[char]
    end

    if i == 4
      marker_found = true
      break
    end
  end
end

p start + 4

# Part 2

start = 0
marker_found = false

while start < input.size - 13 && !marker_found do
  counts = Hash.new(0)
  i = 0

  while i < 14 do
    char = input[start + i]

    if counts[char] == 0
      counts[char] = start + i + 1
      i += 1
    else
      i = 15
      start = counts[char]
    end

    if i == 14
      marker_found = true
      break
    end
  end
end

p start + 14
