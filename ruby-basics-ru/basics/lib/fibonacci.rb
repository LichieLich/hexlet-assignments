# frozen_string_literal: true

# BEGIN
def fibonacci(n)
  return if n < 1
  return 1 if n == 2
  current = 0
  older = 0
  old = 1
  (3..n).each do
    current = old + older
    older = old
    old = current
  end
  current
end
# END