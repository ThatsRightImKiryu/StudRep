# frozen_string_literal: true

# Прямоугольник, характеризующийся размерами. Объект
# умеет выводить на экран значения своих полей и отвечать на запрос о
# площади.

# rubocop:disable Naming/MethodParameterName
class Rectangle
  attr_accessor :a, :b

  def initialize(a = 0, b = 0)
    @a = a
    @b = b
  end

  def square
    @a * @b
  end

  def print
    p @a, @b
  end
end

# Прямоугольный параллелепипед, характеризующийся раз-
# мерами. Объект умеет выводить на экран содержимое своих полей, воз-
# вращать по запросу их содержимое и определять объем параллелепипеда.
class RectPrism < Rectangle
  attr_accessor :h

  def initialize(a = 0, b = 0, h = 0)
    super(a, b)
    @h = h
  end

  def volume
    square * @h
  end

  def print
    super
    p h
  end
end
# rubocop:enable Naming/MethodParameterName
