class Resume < ApplicationRecord
  belongs_to :user
  belongs_to :profile
  has_many :work_experiences
  has_many :resume_skills
  has_many :skills, through: :resume_skills
end
