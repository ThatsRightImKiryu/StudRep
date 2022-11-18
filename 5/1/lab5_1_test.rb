# frozen_string_literal: true

require_relative 'lab5_1_func'
require 'minitest/autorun'

# Documentation
class TestFunc < Minitest::Test
  def test_one
    assert_in_delta(func(5, 3, 2), 0.0049, 10**-3)
  end

  def test_two
    assert_in_delta(func(1, -3, 7), 1.377864, 10**-5)
  end

  def test_three
    assert_nil(func(0, 2, 0)) # знаменатель равен 0
  end
end
