# frozen_string_literal: true

# rubocop:disable Style/For
# BEGIN
def build_query_string(params)
  params.sort.to_h.each_with_object([]) { |(key, value), arr| arr << "#{key}=#{value}" }.join('&')
end
# END
# rubocop:enable Style/For
