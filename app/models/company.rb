class Company < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :phone, presence: true
  validates :about, presence: true
  validates :population, presence: true
  has_many :jobs
  belongs_to :user
end
