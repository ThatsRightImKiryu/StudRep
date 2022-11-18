# frozen_string_literal: true

require_relative 'lab7_2_func'

rec = Rectangle.new(5, 6)

puts 'Доступ к полям объекта-прямоугольника'
p rec.a, rec.b

puts 'Площадь прямоугольника'
p rec.square

puts 'Вывод полей объекта-прямоугольника на экран'
rec.print

rectprism = RectPrism.new(6, 7, 7)

puts 'Доступ к полям объекта - прямоугольного параллелепипеда'
p rectprism.a, rectprism.b, rectprism.h\

puts 'Объем прямоугольного параллелепипеда'
p rectprism.volume

puts 'Вывод полей объекта - прямоугольного параллелепипеда на экран'
rectprism.print
