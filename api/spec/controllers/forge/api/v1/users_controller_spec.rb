require 'rails_helper'

describe Forge::Api::V1::UsersController do

  let(:admin_user) { create :admin_user }

  before do
    set_authentication_headers_for(admin_user)
  end

  describe "#GET #index" do
  end

  describe "#POST #create" do
  end

  describe "#GET #show" do
  end

  describe "#PATCH #update" do
  end

  describe "#DELETE #destroy" do
  end

end