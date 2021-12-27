# frozen_string_literal: true

require './main'
require 'minitest/autorun'
# test.rb
# TestExec is responsible for checking the right calculation of method scale
class TestExec < Minitest::Test
  def test_1
    res = scale(2.0, 0.0001) { |x| x * Math.sin(x) }
    assert_in_delta(1.0997501702946164, res, 1)
  end

  def test_2
    func = ->(x) { Math.tan(x) }
    res = scale(2.0, 0.1, &->(x) { Math.tan(x) })
    assert_in_delta(0.05842395639988977, res, 1)
  end
end
