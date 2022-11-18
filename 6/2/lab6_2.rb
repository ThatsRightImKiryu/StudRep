# frozen_string_literal: true

require_relative 'lab6_2_func'
eps = 10**-3
int = integral(1)
int = int.take_while { |x| x[0] - x[1] > eps }.to_a
puts [int[-1][1, 2]]

eps = 10**-4
int = integral(1)
int = int.take_while { |x| x[0] - x[1] > eps }.to_a
puts [int[-1][1, 2]]
