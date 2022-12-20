# frozen_string_literal: true

def replace_digit(str)
  str.each { |words| words.map! { |word| /^\d/.match(word) ? word.sub(/^\d/, '_') : word } }
end

def get_count_of_replaces(strs)
  strs.map { |s| s.count { |x| x[0] == '_' } }.sum
end

def correct_strings(strs)
  s1 = replace_digit(strs.map!(&:split).map { |words| words.select { |word| /^\w+$/.match(word) } })

  [s1.join(' '), strs.map(&:count).sum - s1.map(&:count).sum + get_count_of_replaces(s1)]
end
