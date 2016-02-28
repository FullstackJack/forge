module Forge
  module Api
    class ApplicationController < ActionController::Base
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
        flash[:alert] = "You are not authorized to perform that action."
        redirect_to(request.referrer || forge_api.dashboard_path)
      end

      def after_sign_in_path_for(resource)
        forge_api.dashboard_path
      end
    end
  end
end
