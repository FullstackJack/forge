require 'rails_helper'

describe Forge::Api::V1::PostsController do

  let(:admin_user) { create :admin_user }
  let(:author_user) { create :author_user }
  let(:posts) { create_list(:post, 10, :user => author_user) }

  before do
    @tokens = set_authentication_headers_for(admin_user)
  end

  # before(:each) do
  #   posts
  # end

  describe "#GET #index" do
    it "responds with multiple posts resources" do
      posts
      get :index
      expect(json["data"].count).to eq(10)
    end
  end

  describe "#GET #show" do
    it "responds with a single post resource" do
      get :show, :id => posts[0].id
      expect(response.status).to eq(200)
      expect(json["data"]['attributes']).to_not be_nil
    end

    it "responds with an error" do
      get :show, :id => 1000
      expect(response.status).to eq(404)
      expect(json["data"]).to be_nil
    end
  end

  describe "#POST #create" do
    it "responds with success message" do
      post :create, { post: { title: "This Is My First Post", body: "It was the best of times, it was the worst of times..." } }
      expect(response.status).to eq(201)
      expect(json["data"]["attributes"]).to_not be_nil
    end
  end

  describe "#PATCH #update" do
    it "responds with success message" do
      post = create :post, { title: "This Is My First Post" }
      patch :update, id: post.id, post: { title: "This Is An Edit" }
      expect(response.status).to eq(200);
      expect(json["data"]["attributes"]["title"]).to eq("This Is An Edit")
    end
  end

  describe "#DELETE #destroy" do
    it "responds with success message" do
      post = create :post
      delete :destroy, id: post.id
      expect(response.status).to eq(204)
    end
  end
end
