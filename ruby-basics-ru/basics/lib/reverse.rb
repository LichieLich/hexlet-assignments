# frozen_string_literal: true

# BEGIN
def reverse(str)
  reversed_string = ''
  1.upto(str.length) {|i| reversed_string += str[-i]}
  reversed_string
end
# END
