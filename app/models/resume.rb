class Resume < ApplicationRecord
  belongs_to :user
  has_many :resume_skills
  has_many :skills, through: :resume_skills
end
