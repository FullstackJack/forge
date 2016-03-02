module Forge
  module Api
    class BaseController < ActionController::Base
      include DeviseTokenAuth::Concerns::SetUserByToken
      include Pundit

      before_action :authenticate_forge_user!, except: [:new, :create]
      after_action :verify_authorized

      rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

      protected

      def pundit_user
        current_forge_user
      end

      private

      def user_not_authorized
        # Clear the previous response body to avoid a DoubleRenderError
        # when redirecting or rendering another view
        self.response_body = nil

        render json: {
          errors: [
            {
              status: 403,
              title: "Not Authorized",
              detail: "You are not authorized to perform that action."
            }
          ]
        }, status: 403
      end

      def after_sign_in_path_for(resource)
        forge_api.dashboard_path
      end
    end
  end
end
