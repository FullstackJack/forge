module Forge
  module Api
    module V1
      class Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
        before_action :configure_sign_up_params
        skip_after_action :verify_authorized

        protected

        def configure_sign_up_params
          devise_parameter_sanitizer.for(:sign_up) << :first_name
          devise_parameter_sanitizer.for(:sign_up) << :last_name
        end
      end
    end
  end
end
