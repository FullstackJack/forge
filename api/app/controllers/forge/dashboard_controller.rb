require_dependency "forge/api/application_controller"

module Forge
  class DashboardController < ApplicationController
    layout "forge/admin"
    def index
      #skip_authorization
    end
  end
end
