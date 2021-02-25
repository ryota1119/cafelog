require 'rails_helper'

RSpec.describe "Owners", type: :request do

  describe "GET /show" do
    it "returns http success" do
      get "/owners/show"
      expect(response).to have_http_status(:success)
    end
  end

end
