class WorkExperience < ApplicationRecord
  validates :title, :start_date, :end_date, presence: true
  belongs_to :profile
  belongs_to :resume
end
