class Job < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true
    validates :address, presence: true
    validates :num_of_people, presence: true
    validates :seniority, presence: true
    validates :salary, presence: true
end
