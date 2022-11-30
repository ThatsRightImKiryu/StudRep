require 'rails_helper'
require 'spec_helper'

RSpec.describe 'Twins', type: :request do
  # Проверка на успешные get запросы
  describe 'GET /input' do
    it 'returns http success' do
      get '/index/input'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /output' do
    it 'returns http redirection' do
      get '/index/output'
      expect(response).to have_http_status(:redirect)
    end
  end

  # Проверка на успешное добавление и поиск элемента в БД
  describe 'Add and search db(check adding to db)' do
    i = rand(1..100)
    it 'Adds correctly' do
      get "/index/output/?inpt=#{i}"
      expect(t = Twin.create(input: i, twins: assigns(:result))).not_to be_nil
      t.save
      expect(Twin.find_by_input(i)).not_to be_nil
    end
  end

  # Проверка на уникальность созданных полей
  # При добавлении через форму проверяет в контроллере, в других случаях смотрит на
  #  validates_uniqueness_of :input, :twins в models/twins.rb

  describe 'Only unique elements' do
    it 'Adds correctly' do
      i = rand(1..100)
      k = rand(5..10)
      k.times do
        [[i, rand(1..100), rand(1..100)], [rand(1..100), i + 1, k + 1], [i + 2, i + 2, k + 2]].each do |input, f, s|
          t = Twin.create(input: input, twins: [f, s]) 
          t.save
        end
      end
      expect(Twin.all.count).to eq(3)
    end
  end

  # Проверка на различный результат при различных входных данных
  describe 'WE have different results when enter different input values' do
    it '1!=2' do
      get "/index/output/?inpt=#{i = rand(1..100)}"
      t = Twin.create(input: i, twins: assigns(:result))
      get "/index/output/?inpt=#{i = rand(1..100)}"
      t1 = Twin.create(input: i, twins: assigns(:result))
      expect(t1).not_to eq(t)
    end
  end
end
