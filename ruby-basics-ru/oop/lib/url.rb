# frozen_string_literal: true

# BEGIN
require 'uri'
require 'forwardable'

class Url
  attr_accessor :url, :query_params

  extend Forwardable
  include Comparable

  def initialize(url)
    @url = URI(url)
    unless @url.query.nil?
      @query_params = @url.query.split('&').each_with_object({}) do |param, result|
        param = param.split('=')
        result[param[0].to_sym] = param[1]
      end
    end
  end

  def_delegators :@url, :host, :scheme

  def query_param(key, value = nil)
    query_params[key.to_sym].nil? ? value : query_params[key.to_sym]
  end

  def <=>(other)
    url <=> other.url
  end
end
# END