module Forge
  module Api
    module V1
      class Auth::PasswordsController < DeviseTokenAuth::PasswordsController
        skip_after_action :verify_authorized
      end
    end
  end
end
