class JobMatching < ApplicationRecord
  belongs_to :user
  belongs_to :job
  belongs_to :company
end
