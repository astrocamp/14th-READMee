class Resume < ApplicationRecord
  enum status: { active: 0, delete: 1 }

  scope :active, -> { where(status: :active) }
  scope :delete, -> { where(status: :delete) }

  def soft_delete
    update(stauts: :delete)
  end

  def active?
    status == 'active'
  end
end
