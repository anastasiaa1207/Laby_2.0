# frozen_string_literal: true

load 'main.rb'
puts 'enter Radius: '
r = gets.to_f
puts 'enter eps: '
eps = gets.to_f
puts 'result '
puts(solve(eps: eps, rad: r))
