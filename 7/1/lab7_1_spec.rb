# frozen_string_literal: true

require_relative 'lab7_1_func'
require 'rspec'
# rubocop:disable Metric/BlockLength
describe 'Files' do
  context 'Just ordinary test' do
    it 'Should say its okay and print me count' do
      path = 'test1.dot'
      a = [2, 6, 8, 2].map { |x| ('a'..'z').to_a.sample(x).join }
      write_file(path, *a)

      expect(count(read_file(path))).to eq 2
    end
  end

  context 'Just ordinary test with existed file' do
    it 'Should say its okay and print me count' do
      path = 'test2.dot'
      expect(count(read_file(path))).to eq 3
    end
  end

  context 'Just not ordinary test with words>20' do
    it 'Should say its not okay and print me count' do
      path = 'test3.dot'

      string = '1 2 3 4 5 6 7 8 9 10 11 1211111111111111111111111 13 14 15 16 17 8 19 20 21'

      write_file(path, *string.split(' '))

      expect(count(read_file(path))).to eq nil
    end
  end

  context 'Just not ordinary test with no needed words' do
    it 'Should say its okay and print me 0' do
      path = 'test4.dot'

      string = '1 2 3 4 5 6 7 8 9 1'

      write_file(path, *string.split(' '))

      expect(count(read_file(path))).to eq 0
    end
  end
end

# rubocop:enable Metric/BlockLength
