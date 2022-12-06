require 'rails_helper'
require 'spec_helper'

RSpec.describe 'Proxy', type: :request do
  describe 'GET /' do
    it 'Check server response' do
      { 'server': 'html', 'client': 'xml', 'client-with-xslt': 'xml' }.each do |side, type|
        get '/proxy/output/', params: { inpt: rand(1..30), side: side, commit: 'Отправить' }
        expect(response).to have_http_status(:success)
        expect(response.headers['Content-Type']).to include(type)
      end
    end
  end
end
