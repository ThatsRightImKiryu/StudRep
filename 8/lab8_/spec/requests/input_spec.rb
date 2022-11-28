require 'rails_helper'

RSpec.describe 'Inputs', type: :request do
  describe 'GET /compute' do
    it 'returns http success' do
      get '/enter/compute'
      expect(response).to have_http_status(:redirect)
    end
  end
  it 'populates an array of articles' do
    get '/enter/input/?inpt=3'
    expect(assigns(:input)).to eq([3, 5])
  end
end
