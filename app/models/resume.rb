class Resume < ApplicationRecord
  belongs_to :user
  belongs_to :profile
  has_many :resume_skills
  has_many :skills, through: :resume_skills

  validates :about_me, length: { maximum: 370 }
  validates :work_exp_content_1, length: { maximum: 120 }
  validates :work_exp_content_2, length: { maximum: 120 }
  validates :project_content_1, length: { maximum: 188 }
  validates :project_content_2, length: { maximum: 188 }
end