class Blog < ApplicationRecord
   validates :title, :content, presence: true


end
