class CompanyPolicy < ApplicationPolicy
  def show?
    user_employer? && (user_has_company? || user_can_create_company?)
  end

  def new?
    user_employer?
  end

  def create?
    user_employer?
  end

  def edit?
    user_employer? && user_has_company?
  end

  def update?
    user_employer? && user_has_company?
  end

  private
  def user_employer?
    user.employer?
  end

  def user_has_company?
    user.company.present?
  end

  def user_can_create_company?
    record.user == user
  end
end
