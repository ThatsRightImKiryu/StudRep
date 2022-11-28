require 'rails_helper'
require 'spec_helper'

RSpec.describe 'Xml', type: :request do
  before do
    @cont = XmlController.new
  end

  describe 'GET /' do
    it 'returns http success' do
      get '/', params: { inpt: 10, format: :rss }

      expect(response).to have_http_status(:success)
      expect(response.headers['Content-Type']).to include('application/rss+xml')
    end

    it 'Compares two responses with different values' do
      get '/', params: { inpt: rand(1..30), format: :xml }
      response1 = response.clone
      get '/', params: { inpt: rand(30..101), format: :xml }

      expect(response.body).not_to eq(response1.body)
    end
  end
end
