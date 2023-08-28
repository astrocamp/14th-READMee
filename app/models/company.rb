class Company < ApplicationRecord
  validates :name, :address, :phone, :about, :population, presence: true
  has_many :jobs
  belongs_to :user
end
