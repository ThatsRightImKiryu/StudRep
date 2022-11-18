require 'rails_helper'

RSpec.describe "Inputs", type: :request do
  describe "GET /compute" do
    it "returns http success" do
      get "/input/compute"
      expect(response).to have_http_status(:success)
    end
  end

end
