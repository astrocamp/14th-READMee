class AddWorkEducationToResumes < ActiveRecord::Migration[7.0]
  def change
    add_column :resumes, :work_exp_name_1, :string
    add_column :resumes, :work_exp_content_1, :text
    add_column :resumes, :work_exp_start_date_1, :string
    add_column :resumes, :work_exp_end_date_1, :string
    add_column :resumes, :work_exp_name_2, :string
    add_column :resumes, :work_exp_content_2, :text
    add_column :resumes, :work_exp_start_date_2, :string
    add_column :resumes, :work_exp_end_date_2, :string
    add_column :resumes, :education_name_1, :string
    add_column :resumes, :education_start_date_1, :string
    add_column :resumes, :education_end_date_1, :string
    add_column :resumes, :education_name_2, :string
    add_column :resumes, :education_start_date_2, :string
    add_column :resumes, :education_end_date_2, :string
  end
end
