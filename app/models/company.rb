class Company < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :phone, presence: true
  validates :about, presence: true
  validates :population, presence: true
  has_many :jobs
  belongs_to :user

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["job"]
  end
end
