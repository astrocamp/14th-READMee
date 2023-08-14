class JobsRemoveColumnCompanyName < ActiveRecord::Migration[7.0]
  def change
    remove_column :jobs, :company_name
  end
end
