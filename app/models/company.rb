class Company < ApplicationRecord
  validates :name, :address, :phone, :about, :population, presence: true
  validates_format_of :phone, with: /\A\d{8}\z/
  has_many :jobs
  belongs_to :user

  has_one_attached :logo do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["job"]
  end
end
