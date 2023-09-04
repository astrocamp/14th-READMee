class AddInterviewNotificationToJobMatchings < ActiveRecord::Migration[7.0]
  def change
    add_column :job_matchings, :interview_date, :date
    add_column :job_matchings, :interview_time, :time
    add_column :job_matchings, :interview_message, :text
    add_column :job_matchings, :notified, :boolean, default: false
  end
end
