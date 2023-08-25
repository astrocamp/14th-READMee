class Company < ApplicationRecord
  validates :name, :address, :phone, :about, :population, presence: true
  has_many :jobs
  belongs_to :user

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["job"]
  end
end
