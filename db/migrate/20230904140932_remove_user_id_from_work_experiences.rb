class RemoveUserIdFromWorkExperiences < ActiveRecord::Migration[7.0]
  def change
    remove_column :work_experiences, :user_id, :integer
  end
end
