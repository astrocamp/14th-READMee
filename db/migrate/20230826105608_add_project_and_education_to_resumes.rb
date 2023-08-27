class AddProjectAndEducationToResumes < ActiveRecord::Migration[7.0]
  def change
    add_column :resumes, :project, :text
    add_column :resumes, :education, :text
  end
end
