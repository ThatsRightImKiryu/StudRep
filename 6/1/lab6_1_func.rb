# frozen_string_literal: true

# rubocop:disable Naming/MethodParameterName
def func(x)
  Math.sqrt(1 + (1 / x)**2)
end

def compute(hip, count, border)
  i1 = 0
  count.times do |i|
    i1 += hip * func(border + hip * i)
  end
  i1
end

def integral(n, eps, a = 1.0, b = 2.0)
  i1 = 1
  i2 = 0
  while i1 - i2 > eps
    i1 = compute((b - a) / n, n, a)
    i2 = compute((b - a) / (n *= 2), n, a)
  end
  [i1, n / 2]
end
# rubocop:enable Naming/MethodParameterName
