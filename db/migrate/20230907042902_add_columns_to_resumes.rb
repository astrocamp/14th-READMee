class AddColumnsToResumes < ActiveRecord::Migration[7.0]
  def change
    add_column :resumes, :full_name, :string
    add_column :resumes, :phone, :string
    add_column :resumes, :address, :string
    add_column :resumes, :job_hunting, :string
  end
end
