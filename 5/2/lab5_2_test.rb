# frozen_string_literal: true

require_relative 'lab5_2_func'
require 'minitest/autorun'

# Class for testing strings
class TestFunc < Minitest::Test
  def test_first
    date = '2019-1-3 2007-11-19 2015-8-21 2020-11-23 2003-5-13 2004-9-23 2018-9-25 2029-11-23' \
     ' 2017-10-9 2007-7-18 2010-10-6 2016-11-22'
    assert_equal('2020-11-23', max_date(date))
  end

  def test_wrong_input
    date = '23a3-123'
    assert_nil(max_date(date))
  end

  def test_two
    assert_nil(max_date(''))
  end
end
