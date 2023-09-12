class RemoveColumnTitleFromResumes < ActiveRecord::Migration[7.0]
  def change
    remove_column :resumes, :basic_info, :text
    remove_column :resumes, :avatar, :string
    remove_column :resumes, :about_me_title, :string
    remove_column :resumes, :project_title, :string
    remove_column :resumes, :education_title, :string
    remove_column :resumes, :work_experience_title, :string
    remove_column :resumes, :skills, :string
    remove_column :resumes, :languages, :string
  end
end
