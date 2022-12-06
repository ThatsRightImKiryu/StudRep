require 'rails_helper'
require 'spec_helper'
RSpec.describe 'Twins', type: :request do
  # Проверка на успешные get запросы
  describe 'GET /input' do
    it 'returns http success' do
      get root_path
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
      expect(Twin.create(input: i)).not_to be_nil
      expect(Twin.find_by_input(i)).not_to be_nil
    end
  end

  # Проверка на уникальность созданных полей
  # При добавлении через форму проверяет в контроллере, в других случаях смотрит на
  #  validates_uniqueness_of :input, :twins в models/twins.rb

  # Проверка на различный результат при различных входных данных
  describe 'WE have different results when enter different input values' do
    it '1!=2' do
      i = rand(1..100)
      t = Twin.create(input: i)
      t1 = Twin.create(input: i + 1)
      expect(t1).not_to eq(t)
    end
  end
end

RSpec.describe 'Test model', type: :model do
  it 'another checks uniqueness_of field' do
    Twin.create!(input: 15)
    expect { Twin.create!(input: 15) }.to raise_error ActiveRecord::RecordInvalid
  end
end
