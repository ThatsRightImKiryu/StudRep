require 'rails_helper'
require 'spec_helper'

RSpec.describe 'Proxy', type: :request do
  describe 'GET /' do
    it 'Compares two responses with different values' do
      get '/proxy/input', params: { inpt: rand(1..30), side: 'server' }
      response1 = response.clone
      get '/proxy/input', params: { inpt: rand(1..30), side: 'client' }
      response2 = response.clone
      get '/proxy/input', params: { inpt: rand(1..30), side: 'client-with-xslt' }
    end
  end
end
