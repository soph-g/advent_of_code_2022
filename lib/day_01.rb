require_relative './utils'

test = false
day = '01'
arr = create_array(file_path(day, test))

# Part 1
max = 0
elf_total = 0

arr.each do |item|
  if item != ""
    elf_total += item.to_i
  else
    max = [max, elf_total].max
    elf_total = 0
  end
end

p max

# Part 2

maxes = [0, 0, 0]
elf_total = 0

arr.each do |item|
  if item != ""
    elf_total += item.to_i
  else
    if elf_total > maxes[2]
      new_val = elf_total
      maxes.each_index do |i|
        tmp = maxes[i]
        if maxes[i] < new_val
          maxes[i] = new_val
          new_val = tmp
        end
      end
    end

    elf_total = 0
  end
end

p maxes.reduce(:+)
