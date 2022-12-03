require_relative './utils'

test = false
day = '03'
arr = create_array(file_path(day, test))

# Part 1
# vJrwpWtwJgWr hcsFMMfFFhFp

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
