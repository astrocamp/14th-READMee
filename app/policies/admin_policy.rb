class AdminPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
    def resolve
      if user.admin?
        scope.all
      else
        scope.none  # 不允許普通使用者訪問任何記錄
      end
    end
  end
end
