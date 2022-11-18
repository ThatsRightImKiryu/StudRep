# frozen_string_literal: true

require_relative 'lab5_3_func'

s = gets

print "Current strings: #{s}\nCorrected string:#{correct_strings(s)[0]}\n" \
  "Number of corrections is #{correct_strings(s)[1]}\n"
