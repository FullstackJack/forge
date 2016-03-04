module Forge
  class PostPolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        scope
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

    def delete?
      user.admin? || record.user == user
    end
  end
end
