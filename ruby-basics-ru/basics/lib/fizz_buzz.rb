# frozen_string_literal: true

# BEGIN
def fizz_buzz(start, stop)
  return if stop < start
  result_string = []
  (start..stop).each do |i|
    result_string << if (i % 3 == 0) && (i % 5 == 0)
                      'FizzBuzz'
                     elsif i % 5 == 0
                       'Buzz'
                     elsif i % 3 == 0
                       'Fizz'
                     else 
                      "#{i}"
                    end
  end
  result_string.join(' ')
end
# END