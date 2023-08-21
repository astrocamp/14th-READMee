class Profile < ApplicationRecord
  validates :full_name, :phone, :address, :job_title, :education, :about_me, :work_experience,
            presence: true

  # relationships
  belongs_to :user
  has_one_attached :avatar
  has_many :profile_skills
  has_many :skills, through: :profile_skills
end
