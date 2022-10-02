# frozen_string_literal: true

# BEGIN
def count_by_years(users)
  result = Hash.new(0)
  users.each do |user|
    year = user[:birthday][0..3]
    result[year] += 1 if user[:gender] == 'male'
  end
  result
end
# END