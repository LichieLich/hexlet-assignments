# frozen_string_literal: true

require 'open-uri'

class Hacker
  class << self
    def hack(email, password)
      # BEGIN
      page = URI.open("https://rails-collective-blog-ru.hexlet.app/users/sign_up")
      csrf_token = Nokogiri::HTML(page).at_css('input[type=hidden]').attributes['value'].value

      params = {
        'user[email]' => email,
        'user[password]' => password,
        'user[password_confirmation]' => password,
        'authenticity_token' => csrf_token
      }

      uri = URI.parse('https://rails-collective-blog-ru.hexlet.app/users')
      Net::HTTP.start(uri.host, uri.port, :use_ssl => true) do |http|
        request = Net::HTTP::Post.new(uri.request_uri)
        request.set_form_data(params)
        request['Cookie'] = page.metas['set-cookie'].first

        response = http.request(request)
      end
      # END
    end
  end
end
