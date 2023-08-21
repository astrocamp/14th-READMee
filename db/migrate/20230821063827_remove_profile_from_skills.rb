class RemoveProfileFromSkills < ActiveRecord::Migration[7.0]
  def change
    remove_reference :skills, :profile, foreign_key: true
  end
end
