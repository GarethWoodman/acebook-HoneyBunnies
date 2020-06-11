require 'rails_helper'

RSpec.describe "Friends", type: :request do

  describe "GET /create" do
    it "returns http success" do
      get "/friends/create"
      expect(response).to have_http_status(:success)
    end
  end

end
