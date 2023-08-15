class Profile < ApplicationRecord
  validates :full_name, :phone, :address, :job_title, :education, :about_me, :work_experience, presence: true
  
  # relationships
  belongs_to :user
  has_one_attached :avatar

  def add_language(language, level)
    self.languages ||= {}
    self.languages[language] = level
  end
end
