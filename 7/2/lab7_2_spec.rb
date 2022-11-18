# frozen_string_literal: true

require_relative 'lab7_2_func'
require 'rspec'

describe Rectangle do
  before :each do
    @rec = Rectangle.new
  end

  context 'Its a test for class rectangle defintion' do
    it 'Should say that it is rectangle and ok' do
      expect(@rec.instance_of?(Rectangle)).to eq true
    end
  end

  context 'Its a test for changing and returning inner fields' do
    it 'should say return me what I need' do
      @rec.a = 7
      @rec.b = 7
      expect(@rec.a).to eq 7
      expect(@rec.b).to eq 7
    end
  end

  context 'Its a test for returning square' do
    it 'should say return me what I need' do
      @rec.a = 10
      @rec.b = 8
      expect(@rec.square).to eq 80
    end
  end
end

# rubocop:disable Metric/BlockLength
describe RectPrism do
  before :each do
    @rectprism = RectPrism.new
  end

  context 'Its a test for class rectangle prism defintion' do
    it 'Should say that it is rectangle prism and ok' do
      expect(@rectprism.instance_of?(RectPrism)).to eq true
    end
  end

  context 'Its a test for class rectangle prism defintion' do
    it 'Should say that it is rectangle child and ok' do
      expect(@rectprism.is_a?(Rectangle)).to eq true
    end
  end

  context 'Its a test for changing and returning inner fields' do
    it 'should say return me what I need' do
      @rectprism.a = 7
      @rectprism.b = 7
      @rectprism.h = 11
      expect(@rectprism.a).to eq 7
      expect(@rectprism.b).to eq 7
      expect(@rectprism.h).to eq 11
    end
  end

  context 'Its a test for returning square' do
    it 'should say return me what I need' do
      @rectprism.a = 8
      @rectprism.b = 9
      @rectprism.h = 100.0 / 72
      expect(@rectprism.volume).to eq 100
    end
  end
end
# rubocop:enable Metric/BlockLength
