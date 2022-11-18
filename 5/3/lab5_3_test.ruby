# frozen_string_literal: true

require_relative 'lab5_3_func'
require 'minitest/autorun'

# Documention
class TestFunc < Minitest::Test
  def test_value
    assert_equal('asd _qwe yeayeah', correct_strings('asd 1qwe notcorrect* yeayeah')[0])
  end

  def test_count
    assert_equal(3, correct_strings("popmusicisgood incorrectsymbols()&&&isnotgood '\' -")[1])
  end

  def test_good
    assert_equal(0, correct_strings('its a good string')[1])
  end

  def test_no_result
    assert_equal(['', 0], correct_strings(''))
  end

  #    Генерирую случайные строки так, что
  #     1)Всего слов 10
  #     2)Если индекс слова делится нацело на 3, то добавить в него спец. символ
  #     3)У слова с пятым индексом стоит слово с цифрой в начале
  #     В итоге, получается 5 исправлений, одно из которых это замена первого символа-числа на "_"
  #     Пример: 'a`dw mkfdkl nvfe c!we poi 1mkgdf lk$j ngh fds qw&e'
  
  def setup
    @string = ''
  end

  def test_random 
    checked_string = ''

    10.times do |i|
      if i == 5
        @string += Random.rand(0..9).to_s
        checked_string += '_' unless (i % 3).zero?
      end

      Random.rand(1..5).times do
        first_letters = Random.rand(65..90).chr
        @string += first_letters
        checked_string += first_letters unless (i % 3).zero?
      end

      @string += Random.rand(33..47).chr if (i % 3).zero?

      Random.rand(1..5).times do
        first_letters = Random.rand(97..122).chr
        @string += first_letters
        checked_string += first_letters unless (i % 3).zero?
      end

      @string += ' '
      checked_string += ' ' unless (i % 3).zero?
    end
    assert_equal(correct_strings(@string), [checked_string[0..-2], 5])
  end

  def test_random_no_corrs
    10.times do
      Random.rand(2..7).times do
        @string += Random.rand(65..90).chr
      end
      @string += ' '
    end
    assert_equal(correct_strings(@string), [@string[0..-2], 0])
  end
end
