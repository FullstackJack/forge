module Forge
  module Api
    module V1
      class Auth::TokenValidationsController < DeviseTokenAuth::TokenValidationsController
        skip_after_action :verify_authorized
      end
    end
  end
end
