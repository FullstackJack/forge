module Forge
  module Api
    module V1
      class Auth::OmniauthCallbacksController < DeviseTokenAuth::OmniauthCallbacksController
        skip_after_action :verify_authorized
      end
    end
  end
end
