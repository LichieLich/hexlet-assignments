# frozen_string_literal: true

class AdminPolicy
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    status, headers, body = @app.call(env)
    request = Rack::Request.new(env)
    if request.path.include?('/admin')
      timer = body.select { |string| string.include?('Page loaded for')}.first
      [403, {}, [timer]]
    else
      [status, headers, body]
    end
    # END
  end
end
