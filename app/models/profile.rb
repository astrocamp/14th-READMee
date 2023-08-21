class Profile < ApplicationRecord
  validates :full_name, :phone, :address, :job_title, :education, :about_me, :work_experience,
            presence: true

  # relationships
  belongs_to :user
  has_one_attached :avatar
  has_many :skills, dependent: :destroy, inverse_of: :profile
  accepts_nested_attributes_for :skills, allow_destroy: true, reject_if: :all_blank

  def add_language(language, level)
    self.languages ||= {}
    self.languages[language] = level
  end
end
