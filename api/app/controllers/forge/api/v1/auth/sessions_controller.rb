module Forge
  module Api
    module V1
      class Auth::SessionsController < DeviseTokenAuth::SessionsController
        skip_after_action :verify_authorized
      end
    end
  end
end
