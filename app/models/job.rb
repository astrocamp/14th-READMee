class Job < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :num_of_people, presence: true
  validates :seniority, presence: true
  validates :salary, presence: true
  belongs_to :company

  def self.myjobs
    where(deleted_at: nil).order(id: :desc)
  end
  
end
