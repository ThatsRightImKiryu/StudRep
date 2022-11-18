# frozen_string_literal: true

require_relative 'lab5_1_func'
puts 'Input x,y,z\n'

str  = gets
if /^(\d+ *){3}$/.match(str)
  x, y, z = str.split.map(&:to_i)

  p func(x, y, z)
else
  p 'Wrong input'
end
