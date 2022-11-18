# frozen_string_literal: true

require 'prime'

# Controller for app
class EnterController < ApplicationController
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

  def compute
    @input = params[:inpt]
    if !/^-?\d+$/.match(@input)
      flash[:notice] = 'Введено не число'
    elsif !(@input = @input.to_i).positive?
      flash[:notice] = 'Введено отрицательное число'
    else
      @result = twins(@input)
      return @prime_arr = (@input..2 * @input).select(&:prime?)
    end
    redirect_to '/enter/input'
  end
end
