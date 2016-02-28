require 'rails_helper'

describe Forge::Api::V1::PostsController do

  let(:admin_user) { create :admin_user }
  let(:post) { create :post }

  before do
    set_authentication_headers_for(admin_user)
  end

  describe "#GET #index" do
    it "shows the posts resource" do
      api_get :index
      expect(JSON.parse(response.body)).to eq({ "data" => []})
    end
  end
end
