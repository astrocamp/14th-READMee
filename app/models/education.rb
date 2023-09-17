class Education < ApplicationRecord
  validates :title, :start_date, :end_date, presence: true

  belongs_to :profile
end
