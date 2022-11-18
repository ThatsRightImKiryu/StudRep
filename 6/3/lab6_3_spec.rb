# frozen_string_literal: true

require_relative 'lab6_3_func'
require 'rspec'

func = proc { |x| x + 2 != 0 ? (x - 1) / (x + 2) : nil }
lambda_func = ->(x) { Math.sin(x / 2 - 1) }

describe 'Find min/max of functions' do
  context 'When first testing minmax of y = (x - 1)/(x + 2)' do
    it 'should say its a finding min well' do
      f = minmax(0.0, 2.0, &func)[0]

      expect(f).to be_between(-0.51, -0.49).inclusive
    end

    it 'should say its a finding max well' do
      f = minmax(0.0, 2.0, &func)[1]

      expect(f).to be_between(0.247, 0.25).inclusive
    end

    context 'When second testing minmax of sin(x / 2 + 1)' do
      it 'should say its a finding min well' do
        f = minmax(-1.0, 1.0, &lambda_func)[0]

        expect(f).to be_between(-1, -0.98).inclusive
      end

      it 'should say its a finding max well' do
        f = minmax(-1.0, 1.0, &lambda_func)[1]

        expect(f).to be_between(-0.5, -0.48).inclusive
      end
    end
  end
end
