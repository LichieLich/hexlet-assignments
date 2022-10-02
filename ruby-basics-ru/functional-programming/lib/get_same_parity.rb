# frozen_string_literal: true

# BEGIN
def get_same_parity(list)
  return [] if list.empty?
  result = list.select { |n| n % 2 == list[0] % 2 }
end
# END