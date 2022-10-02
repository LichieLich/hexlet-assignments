# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def setup
    @stack = Stack.new
    @filled_stack = Stack.new(['ruby', 'java'])
  end

  def test_conversion_to_array
    assert { @stack.to_a.is_a? Array }
    assert { @filled_stack.to_a == ['ruby', 'java']}
  end

  def test_stack_size
    assert { @filled_stack.size == 2 }
  end

  def test_pushing_to_the_top
    @stack.push! 'ruby'
    assert { @stack.size == 1}
    @stack.push! 'java'
    assert { @stack.size == 2}
    assert { @stack.to_a[1] == 'java' }
  end

  def test_pop_last_element
    @filled_stack.pop!
    assert { @filled_stack.size == 1 }
    assert { @filled_stack.to_a[0] == 'ruby' }
  end

  def test_pop_empty_stack
    assert { @stack.pop!.to_a == [] }
  end

  def test_clearing_stack
    assert { @filled_stack.clear!.to_a == [] }
  end

  def test_emptiness_check
    assert { @stack.empty? == true }
    assert { @filled_stack.empty? == false }
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
