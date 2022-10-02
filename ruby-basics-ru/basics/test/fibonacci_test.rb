# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/fibonacci'

class FibonacciTest < Minitest::Test
  def test_fibonacci
    assert { fibonacci(2) == 1 }
    assert { fibonacci(10) == 34 }
    assert { fibonacci(15) == 377 }
    assert { fibonacci(25) == 46_368 }

    assert { fibonacci(-100).nil? }
    assert { fibonacci(0).nil? }
    assert { fibonacci(1).zero? }
  end
end
