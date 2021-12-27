# frozen_string_literal: true

def area(n, r)
  0.5 * r**2 * n * Math.sin(2 * Math::PI / n)
end

def solve(eps:, rad:)
  enum = Enumerator.new do |y|
    k = 4
    s1 = area(k, rad)
    loop do
      s = s1
      k *= 2
      s1 = area(k, rad)
      y << [s, s1]
    end
  end
  a = enum.each_with_index.find { |x| x[0][1] - x[0][0] < eps }
  [a[0][1], a[1] + 1]
end
