class AddReferenceToResumes < ActiveRecord::Migration[7.0]
  def change
    add_reference :resumes, :work_experience, foreign_key: true, null: false
    add_reference :resumes, :project, foreign_key: true, null: false
    add_reference :resumes, :education, foreign_key: true, null: false
  end
end