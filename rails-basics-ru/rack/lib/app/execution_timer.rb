# frozen_string_literal: true

class ExecutionTimer
  def initialize(app)
    @app = app
  end

  def call(env)
    t1 = Time.now
    status, headers, body = @app.call(env)
    body << "\nPage loaded for #{(Time.now - t1)*1000} ms"
    request = Rack::Request.new(env)
    [status, headers, body]
  end
end