class UserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
    
    # 自定義
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
