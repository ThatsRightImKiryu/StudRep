# frozen_string_literal: true

require_relative 'lab6_1_func'
require 'rspec'

describe 'Integrals' do
  context 'When first testing integral values' do
    it 'should say its a good calcultaing' do
      expect(integral(10**-3)[0]).to be_between(1.22, 1.24).inclusive
    end
  end

  context 'When second testing integral values' do
    it 'should say its a good calcultaing' do
      expect(integral(10**-4)[0]).to be_between(1.22, 1.24).inclusive
    end
  end
end
