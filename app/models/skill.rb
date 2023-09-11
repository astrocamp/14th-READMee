class Skill < ApplicationRecord
  has_many :profile_skills
  has_many :profiles, through: :profile_skills
  has_many :resume_skills
  has_many :resumes, through: :resume_skills
end
