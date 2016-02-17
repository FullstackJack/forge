module Forgecms
  class ApplicationController < ActionController::Base
    include DeviseTokenAuth::Concerns::SetUserByToken
    include Pundit
    before_action :authenticate_user!
    after_action :verify_authorized

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    private

    def user_not_authorized
      flash[:alert] = "You are not authorized to perform that action."
      redirect_to(request.referrer || forgecms.dashboard_path)
    end

    def after_sign_in_path_for(resource)
      forgecms.dashboard_path
    end
  end
end
