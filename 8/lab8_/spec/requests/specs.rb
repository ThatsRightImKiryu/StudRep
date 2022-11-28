require 'rails_helper'
require 'spec_helper'

RSpec.describe 'Enters', type: :request do
  before do
    @cont = EnterController.new
  end

  describe 'GET /input' do
    it 'returns http success' do
      get '/enter/input'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /compute' do
    it 'returns http redirection' do
      get '/enter/compute'
      expect(response).to have_http_status(:redirect)
    end
  end

  describe 'Rendering templates' do
    it 'return input template' do
      get '/enter/input'
      expect(response).to render_template('input')
    end

    it 'return compute template' do
      get '/enter/compute?inpt=5'
      expect(response).to render_template('compute')
    end
  end

  describe 'Check returning params' do
    it 'populates an array of articles' do
      get '/enter/compute/?inpt=5'
      expect(assigns(:result)).to eq([[5, 7]])
    end

    it 'populates an array of articles' do
      get '/enter/compute/', params: { inpt: '1' }
      expect(assigns(:result)).to be_nil
    end
  end
end
