class SocialLink < ApplicationRecord
  validates :title, :link, presence: true

  belongs_to :profile
end
