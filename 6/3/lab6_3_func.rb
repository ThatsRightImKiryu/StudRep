# frozen_string_literal: true

# rubocop:disable Naming/MethodParameterName
def minmax(a, b, &function)
  min = max = yield a
  while a < b
    f = function.call(a)
    max = f if f > max
    min = f if f < max
    a += 0.01
  end
  [min, max]
end
# rubocop:enable Naming/MethodParameterName
