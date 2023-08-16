# frozen_string_literal: true

# 管理員策略
class AdminPolicy < ApplicationPolicy
  # 管理員範圍
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.none  # 不允許普通使用者訪問任何記錄
      end
    end
  end
end
