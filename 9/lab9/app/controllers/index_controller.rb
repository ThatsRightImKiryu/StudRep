# frozen_string_literal: true

require 'prime'

# Controller for app
class IndexController < ApplicationController
  def input; end

  # rubocop:disable Naming/MethodParameterName
  def twins(n)
    arr = []
    primes = (n..2 * n).to_a.select(&:prime?)
    (primes.length - 1).times do |i|
      arr << [primes[i], primes[i + 1]] if primes[i + 1] - primes[i] == 2
    end
    return arr unless arr.length.zero?

    nil
  end
  # rubocop:enable Naming/MethodParameterName

  def output
    @input = params[:inpt]
    check(@input)
  end

  private

  def check(str)
    if !/^-?\d+$/.match(str)
      flash[:alert] = 'Не число'
    elsif !(str = str.to_i).positive?
      flash[:alert] = 'Отрицательное число'
    else
      @result = twins(str)
      @prime_arr = (str..2 * str).select(&:prime?)
    end
  end
end
