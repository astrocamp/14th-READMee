class JobMatching < ApplicationRecord
  # validates :interview_date, :interview_time, :interview_message, presence: true
  # validates :notified, inclusion: { in: [true, false] }

  belongs_to :user
  belongs_to :job
  belongs_to :company

  def self.create_matching(user_id, job_id, company_id, job_matching)
    job_matching.user_id = user_id
    job_matching.job_id = job_id
    job_matching.company_id = company_id
    job_matching.save
  end
end

