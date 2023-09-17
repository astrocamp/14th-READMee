class RemoveProjectStateFromResumes < ActiveRecord::Migration[7.0]
  def change
    remove_column :resumes, :project_state, :boolean
  end
end
