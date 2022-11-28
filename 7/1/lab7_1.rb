# frozen_string_literal: true

require_relative 'lab7_1_func'

path = 'result.dot'

string = '123 asd dxqw 1233333 x1adx 22'

write_file(path, *string.split(' '))

p count(read_file(path))
