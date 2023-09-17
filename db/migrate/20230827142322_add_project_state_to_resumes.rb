class AddProjectStateToResumes < ActiveRecord::Migration[7.0]
  def change
    add_column :resumes, :project_state, :boolean
  end
end
