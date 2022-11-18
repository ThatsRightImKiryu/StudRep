# frozen_string_literal: true

require_relative 'lab6_2_func'
require 'rspec'

describe 'Integral' do
  before :each do
    @int = integral(1)
  end

  context 'When first testing integral values' do
    it 'should say its a good calcultaing' do
      eps = 10**-3
      @int = @int.take_while { |x| x[0] - x[1] > eps }.to_a
      expect(@int[-1][1]).to be_between(1.22, 1.24).inclusive
    end
  end

  context 'When second testing integral values' do
    it 'should say its a good calcultaing' do
      eps = 10**-4
      @int = @int.take_while { |x| x[0] - x[1] > eps }.to_a
      expect(@int[-1][1]).to be_between(1.22, 1.24).inclusive
    end
  end
end
