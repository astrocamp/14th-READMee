class Blog < ApplicationRecord
   validates :title, :content, presence: true

   acts_as_paranoid

end
