class Job < ApplicationRecord
  acts_as_paranoid
  validates :title, :content, :num_of_people, :seniority, :salary, presence: true
  belongs_to :company

  def self.ransackable_attributes(auth_object = nil)
    ["content", "title"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["company"]
  end
end
