# frozen_string_literal: true

require 'prime'

# Контроллер с 8 лабы, ничего нового здесь нет

# Controller for app
class IndexController < ApplicationController
  def input; end

  def output
    @input = params[:inpt]
    if !/^-?\d+$/.match(@input)
      flash[:notice] = 'Введено не число'
    elsif !(@input = @input.to_i).positive?
      flash[:notice] = 'Введено отрицательное число'
    else
      @result = twins(@input)
      return @prime_arr = (@input..2 * @input).select(&:prime?)
    end
    redirect_to root_path
  end

  private

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
end
