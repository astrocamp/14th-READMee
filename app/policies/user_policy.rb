class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def index?
      user.admin?
    end

    def show?
      user.admin? || record == user
    end

    def update?
      user.admin? || record == user
    end

    def destroy?
      user.admin?
    end
  end
end
