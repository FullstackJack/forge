require 'rails_helper'

RSpec.describe Forge::Api::BaseController do

  let(:user) { create(:user) }

  controller do
    def index
      raise Pundit::NotAuthorizedError
    end
  end

  before do
    set_authentication_headers_for(user)
  end

  describe "handling not authorized exceptions" do
    it "responds with not authorized error" do
      api_get :index
      expect(response.status).to eq(401)
      expect(json['errors'][0]['title']).to eq('Not Authorized')
    end
  end
end