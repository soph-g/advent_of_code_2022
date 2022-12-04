require_relative './utils'

test = false
day = '03'
arr = create_array(file_path(day, test))

# Part 1

matched = []
total = 0

arr.each do |rucksack|
  counts = Hash.new(0)
  i = 0

  while i < (rucksack.size / 2) do
    counts[rucksack[i]] += 1
    i += 1
  end

  while i < rucksack.size do
    if counts[rucksack[i]] == 0
      i += 1
    else
      value = rucksack[i].ord

      if value >= 97
        total += value - 96
      else
        total += value - 38
      end

      i = rucksack.size
    end
  end
end

p total

# Part 2

badges = []
total = 0
i = 0
group_max = 2
counts = Hash.new(0)

while i < arr.size do
  rucksack = arr[i]
  rucksack_counts = Hash.new(0)
  x = 0

  while x < rucksack.size do
    char = rucksack[x]

    if rucksack_counts[char] == 0
      rucksack_counts[char] += 1
      counts[char] += 1
    end

    if counts[char] == 3
      value = char.ord

      if value >= 97
        total += value - 96
      else
        total += value - 38
      end
      x = rucksack.size
    else
      x += 1
    end
  end

  if i == group_max
    counts = Hash.new(0)
    group_max += 3
  end

  i += 1
end

p total
