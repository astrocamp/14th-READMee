class AddProjectTitleAndEducationTitleToResumes < ActiveRecord::Migration[7.0]
  def change
    add_column :resumes, :project_title, :string
    add_column :resumes, :education_title, :string
  end
end
