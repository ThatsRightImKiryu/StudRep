# frozen_string_literal: true

require 'set'

def correct_strings(str)
  s1 = str.split(' ').select { |x| /^\w+$/.match(x) }.map { |x| /^\d/.match(x) ? x.sub(/^\d/, '_') : x }

  [s1.join(' '), str.split(' ').length - s1.count + s1.count { |x| x[0] == '_' }]
end
