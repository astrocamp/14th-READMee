class RemoveColumnFromResumes < ActiveRecord::Migration[7.0]
  def change
    remove_column :resumes, :work_experience, :text
    remove_column :resumes, :project, :text
    remove_column :resumes, :education, :text
    remove_reference :resumes, :work_experience, index: true
    remove_reference :resumes, :project, index: true
    remove_reference :resumes, :education, index: true
    add_reference :work_experiences, :resume, foreign_key: true
    add_reference :projects, :resume, foreign_key: true
    add_reference :educations, :resume, foreign_key: true
  end
end