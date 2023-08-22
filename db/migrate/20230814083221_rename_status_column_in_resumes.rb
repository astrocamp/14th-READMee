class RenameStatusColumnInResumes < ActiveRecord::Migration[7.0]
  def change
    rename_column :resumes, :status, :resume_state
  end
end
