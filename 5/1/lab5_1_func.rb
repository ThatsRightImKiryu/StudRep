# frozen_string_literal: true

# rubocop:disable Naming/MethodParameterName

def func(x, y, z)
  f = (x**4 / 2.0 + Math.sin(z)**2)
  ((1 + Math.cos(y - 2)) / f) unless f.zero?
end

# rubocop:enable Naming/MethodParameterName
