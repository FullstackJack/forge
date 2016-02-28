require 'rails_helper'

describe Forge::Api::V1::PostsController do
  describe "#GET #index" do
    it "shows a list of posts" do
      user = build(:user)
      api_get :index
    end
  end
end
