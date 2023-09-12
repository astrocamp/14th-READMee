class AddUserIdToWorkExperiences < ActiveRecord::Migration[7.0]
  def change
    add_column :work_experiences, :user_id, :integer
  end
end
