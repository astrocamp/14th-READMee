class Article < ApplicationRecord
  acts_as_paranoid
  validates :title, :content, presence: true
  belongs_to :user
end
