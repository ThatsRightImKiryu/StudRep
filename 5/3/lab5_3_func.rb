zrequire 'set'

def correct_strings(s)
  s1 = s.split(' ').select { |x| /^\w+$/.match(x) }.map { |x| /^\d/.match(x) ? x.sub(/^\d/, '_') : x }

  [s1.join(' '), s.split(' ').length - s1.count + s1.count { |x| x[0] == '_' }]
end
