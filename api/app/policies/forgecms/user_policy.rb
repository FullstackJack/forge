module Forgecms
  class UserPolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        scope
      end
    end

    def index?
      user.admin?
    end

    def edit?
      user.admin?
    end

    def show?
      user.admin?
    end
  end
end
