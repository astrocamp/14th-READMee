class RemoveSummaryFromResumes < ActiveRecord::Migration[7.0]
  def change
    remove_column :resumes, :summary
  end
end
