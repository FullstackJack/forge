require_dependency "forgecms/application_controller"

module Forgecms
  class DashboardController < ApplicationController
    layout "forgecms/admin"
    def index
      skip_authorization
    end
  end
end
