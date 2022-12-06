# frozen_string_literal:false

# Docs
class Twin < ApplicationRecord
  validates_uniqueness_of :input, :twins, message: 'Введено не уникальное значение'
  validates :input, format: { with: /\A\d+\z/, message: 'Должно быть введено положительное число' }
  before_save :set_twins

  def decoded_twins
    ActiveSupport::JSON.decode(twins)
  end

  private

  def set_twins
    self.twins = ActiveSupport::JSON.encode(calculate_twins)
  end

  def calculate_twins
    arr = []
    primes = (input..2 * input).to_a.select(&:prime?)
    (primes.length - 1).times do |i|
      arr << [primes[i], primes[i + 1]] if primes[i + 1] - primes[i] == 2
    end
    return arr unless arr.length.zero?

    nil
  end
end
