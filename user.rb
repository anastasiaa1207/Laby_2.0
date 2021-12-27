# frozen_string_literal: true

# parser.rb
load 'main.rb'
puts 'Решение при помощи блока:'
puts scale(2.0, 0.0001) { |x| x * Math.sin(x) }
puts 'Решение при помощи lambda:'
puts scale(2.0, 0.1, &->(x) { Math.tan(x) })
