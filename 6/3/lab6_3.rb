# frozen_string_literal: true

require_relative 'lab6_3_func'

func = proc { |x| x + 2 != 0 ? (x - 1) / (x + 2) : nil }
lambda_func = ->(x) { Math.sin(x / 2 - 1) }

puts 'minmax of (x - 1) / (x + 2) in [0,2] with block'
p minmax(0.0, 2.0, &func)
puts
puts 'minmax of sin(x / 2 - 1) in [-1,1] with labmda'
p minmax(-1.0, 1.0, &lambda_func)
