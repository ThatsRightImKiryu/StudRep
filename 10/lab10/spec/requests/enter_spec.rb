require 'rails_helper'

RSpec.describe "Enters", type: :request do
  describe "GET /input" do
    it "returns http success" do
      get "/enter/input"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /compute" do
    it "returns http success" do
      get "/enter/compute"
      expect(response).to have_http_status(:success)
    end
  end

end
