module Forge
  class PostPolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        if user.admin?
          scope.all
        elsif user.author?
          scope.where(user_id: user.id)
        else
          scope.where("published_at < ?", Time.now)
        end
      end
    end

    def index?
      user.author? || user.admin?
    end

    def create?
      user.admin? || user.author?
    end

    def update?
      user.admin? || record.user == user
    end

    def show?
      user.admin? || record.user == user
    end

    def destroy?
      user.admin? || record.user == user
    end
  end
end
