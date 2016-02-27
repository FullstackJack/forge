require 'rails_helper'

module Forge
  module Api
    module V1
      RSpec.describe PostsController, type: :controller do
        describe "#GET #create" do
          it "creates a new post" do
            user = build(:user)
          end
        end
      end
    end
  end
end
