def file_path(day, test = false)
  file = test ? 'test' : 'input'

  "inputs/day_#{day}/#{file}.txt"
end

def create_array(file_path)
  File
    .open(file_path)
    .readlines
    .map(&:chomp)
end
