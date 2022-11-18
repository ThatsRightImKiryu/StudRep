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

def integral(n, a = 1.0, b = 2.0)
  Enumerator.new do |yielder|
    loop do
      yielder << [compute((b - a) / n, n, a), compute((b - a) / (n *= 2), n, a), n]
    end
  end
end
# rubocop:enable Naming/MethodParameterName
