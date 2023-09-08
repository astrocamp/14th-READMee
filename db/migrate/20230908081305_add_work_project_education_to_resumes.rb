class AddWorkProjectEducationToResumes < ActiveRecord::Migration[7.0]
  def change
    add_column :resumes, :work_experience_name, :text
    add_column :resumes, :work_start_date, :string
    add_column :resumes, :work_end_date, :string
    add_column :resumes, :education_name, :string
    add_column :resumes, :education_start_date, :string
    add_column :resumes, :education_end_date, :string
    add_column :resumes, :project_name_1, :string
    add_column :resumes, :project_content_1, :text
    add_column :resumes, :project_name_2, :string
    add_column :resumes, :project_content_2, :text
  end
end