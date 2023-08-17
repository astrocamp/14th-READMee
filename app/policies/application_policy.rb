# frozen_string_literal: true

# 檢查使用者的權限
class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  # 定義範圍的內部類別
  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    # 拋出未實作例外，提示需要在子類別中實現
    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :user, :scope
  end
end
