# frozen_string_literal: true

require 'prime'

# Docs
class XmlController < ApplicationController
  # frozen_string_literal: true

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
    check

    respond_to do |format|
      format.xml { render xml: @result.to_xml }
      format.rss { render xml: @result.to_xml }
    end
  end

  def check
    if !/^-?\d+$/.match(@input)
      flash[:notice] = 'Введено не число'
    elsif !(@input = @input.to_i).positive?
      flash[:notice] = 'Введено отрицательное число'
    elsif (@result = twins(@input)).nil?
      @result = { message: "Для n=#{@input} нет близнецов" }
    else
      @result = @result.map { |x1, x2| { first: x1, second: x2 } }
      @prime_arr = (@input..2 * @input).select(&:prime?)
    end
  end
end
