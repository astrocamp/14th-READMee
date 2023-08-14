class RemoveJobsIdFromCompanies < ActiveRecord::Migration[7.0]
  def change
    remove_column :companies, :jobs_id, :integer
  end
end
