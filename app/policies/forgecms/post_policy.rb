module Forgecms
  class PostPolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        scope
      end
    end

    def index?
      user.admin? || user.author?
    end

    def new?
      user.admin? || user.author?
    end

    def create?
      user.admin? || user.author?
    end

    def edit?
      user.admin? || record.user == user
    end

    def update?
      user.admin? || record.user == user
    end

    def delete?
      user.admin? || record.user == user
    end
  end
end