require 'rails_helper'

RSpec.describe Forge::Api::BaseController, type: :controller do

  controller do
    def index
      raise Pundit::NotAuthorizedError
    end

    def show
      render :nothing => true
    end
  end

  context "as an authenticated user" do
    let(:user) { create(:user) }

    before do
      set_authentication_headers_for(user)
    end

    describe "when not authorized" do
      it "responds with not authorized error" do
        api_get :index
        expect(response.status).to eq(403)
        expect(json['errors'][0]['title']).to eq('Not Authorized')
      end
    end
  end

  context "as an unauthenticated user" do

    describe "when not authenticated" do
      it "responds with authorized users only error" do
        get :show, :id => 1
        expect(response.status).to eq(401)
        expect(json['errors'][0]).to eq('Authorized users only.')
      end
    end
  end
end