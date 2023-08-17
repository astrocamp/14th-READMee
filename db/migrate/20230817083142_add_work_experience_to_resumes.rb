class AddWorkExperienceToResumes < ActiveRecord::Migration[7.0]
  def change
    add_column :resumes, :work_experience_title, :string
  end
end
