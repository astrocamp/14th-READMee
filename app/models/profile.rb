class Profile < ApplicationRecord
  validates :full_name, :phone, :address, :job_title, :education, :about_me, :work_experience,
            presence: true

  # relationships
  belongs_to :user
  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_limit: [128, 128]
  end
  has_many :profile_skills
  has_many :skills, through: :profile_skills
end
