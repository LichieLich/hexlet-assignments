# frozen_string_literal: true

class SetLocaleMiddleware
  # BEGIN
  attr_reader :app

  def initialize(app)
    @app = app
  end

  def call(env)
    switch_locale(env)
    @status, @headers, @response = @app.call(env)
    [@status, @headers, @response]
  end
  
  private

  def switch_locale(env)
    locale = env["HTTP_ACCEPT_LANGUAGE"].scan(/^[a-z]{2}/).first if env['HTTP_ACCEPT_LANGUAGE']
    I18n.locale = locale || I18n.default_locale
  end
  # END
end
