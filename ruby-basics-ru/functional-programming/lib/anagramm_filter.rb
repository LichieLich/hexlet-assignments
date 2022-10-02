# frozen_string_literal: true

# BEGIN
def anagramm_filter(check_word, words)
  check_chars = check_word.chars.sort
  result = words.select { |word| word.chars.sort == check_chars }
end
# END