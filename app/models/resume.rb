class Resume < ApplicationRecord
  belongs_to :user
  belongs_to :profile
  has_many :resume_skills
  has_many :skills, through: :resume_skills

  validates_length_of :about_me, maximum: 620, message: "個人簡介内容不能超過620個字"
  validates_length_of :work_exp_content_1, maximum: 120 , message: "第一份工作内容不能超過120個字"
  validates_length_of :work_exp_content_2, maximum: 120 , message: "第二份工作内容不能超過120個字"
  validates_length_of :project_content_1, maximum: 210 , message: "第一個專案内容不能超過210個字"
  validates_length_of :project_content_2, maximum: 210 , message: "第二個專案内容不能超過210個字"
end