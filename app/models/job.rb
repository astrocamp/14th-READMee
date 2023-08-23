class Job < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :num_of_people, presence: true
  validates :seniority, presence: true
  validates :salary, presence: true
  belongs_to :company

  def self.ransackable_attributes(auth_object = nil)
    [ "company_id", "content", "title"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["company"]
  end
end
