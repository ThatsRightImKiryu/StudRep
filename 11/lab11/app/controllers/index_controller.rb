# frozen_string_literal: false

require 'prime'

# Docs
class IndexController < ApplicationController
  def input; end

  def output
    @input = params[:inpt]

    return redirect_to :input if check

    if (result = Twin.find_by_input(@input))
      @result = ActiveSupport::JSON.decode(result.twins)
    else
      @result = twins(@input)
      result = Twin.create(input: @input, twins: ActiveSupport::JSON.encode(@result))
      result.save
    end
  end

  private

  def show_db
    # Задание с сериализацией
    # Для отрисовки в views/layouts/application.html.erb добавили <html data-turbo:false>
    render xml: Twin.all
  end

  def check
    return flash[:notice] = 'Введено не число' unless /^-?\d+$/.match(@input)
    return flash[:notice] = 'Введено отрицательное число' unless (@input = @input.to_i).positive?

    nil
  end

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
