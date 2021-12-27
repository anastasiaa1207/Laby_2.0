# frozen_string_literal: true

require './main'
require 'minitest/autorun'
# test.rb
# TestExec is responsible for checking the right calculation of method solve
class TestExec < Minitest::Test
  # check for right method execution
  def test_one_001
    r = 1
    eps = 0.001
    result = [3.141277250932773, 6]
    assert(result, solve(eps: eps, rad: r))
  end

  def test_one_0001
    r = 1
    eps = 0.001
    result = [3.1415729403670913, 8]
    assert(result, solve(eps: eps, rad: r))
  end

end

