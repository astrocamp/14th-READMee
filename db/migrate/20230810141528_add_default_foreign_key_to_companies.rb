class AddDefaultForeignKeyToCompanies < ActiveRecord::Migration[7.0]
  def change
    change_column :companies, :jobs_id, :integer, default: 0
  end
end
