require 'rails_helper'

describe Forge::Api::V1::UsersController do

  let(:create_user) { create :user }
  let(:create_admin) { create :admin_user }

  before do
    set_authentication_headers_for(create_admin)
  end

  describe "#GET #index" do
  end

  describe "#POST #create" do
  end

  describe "#GET #show" do
  end

  describe "#PATCH #update" do
    it "responds with success message" do
      user = create :user, first_name: "Scott", last_name: "Kelly"
      patch :update, id: user.id, user: { first_name: "Mark" }
      expect(response.status).to eq(200);
      expect(json["data"]["attributes"]["first_name"]).to eq("Mark")
    end
  end

  describe "#DELETE #destroy" do
    it "responds with success message" do
      user = create_user
      delete :destroy, id: user.id
      expect(response.status).to eq(204)
    end
  end
end