class AddPublishToResumes < ActiveRecord::Migration[7.0]
  def change
    add_column :resumes, :publish, :boolean
  end
end
