require 'rails_helper'

describe Forge::Api::V1::UsersController, :type => :controller do

  let(:create_user) { create :user }
  let(:create_admin) { create :admin_user }
  let(:create_users) { create_list(:user, 15) }

  before do
    set_authentication_headers_for(create_admin)
  end

  describe "#GET #index" do
    context "requesting a list of users" do
      it "responds with many user resources" do
        create_users
        get :index
        expect(json["data"]).to_not be_nil
        expect(json["data"].count).to eq(10)
        expect(response.status).to eq(200)
      end
    end

    context "requesting page 2 of users" do
      it "responds with 5 users" do
        create_users
        get :index, { page: 2 }
        expect(json["data"].count).to eq(6)
      end
    end

    context "requesting 15 users per page" do
      it "responds with 15 users" do
        create_users
        get :index, { count: 15 }
        expect(json["data"].count).to eq(15)
      end
    end
  end

  describe "#POST #create" do
    it "responds with success message" do
      user = {
        user: {
          first_name: "Mark",
          last_name: "Kelly",
          password: "astr04life",
          password_confirmation: "astr04life",
          email: "mark_kelly@nasa.gov"
        }
      }
      post :create, user
      expect(response.status).to eq(201)
      expect(json["data"]["attributes"]["first_name"]).to eq("Mark")
    end
  end

  describe "#GET #show" do
    it "responds with success message" do
      user = create_user
      get :show, id: user.id
      expect(json["data"]["attributes"]["first_name"]).to eq("User")
    end
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