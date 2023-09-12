class RemoveReferenceToWorkExperience < ActiveRecord::Migration[7.0]
  def change
    remove_reference :work_experiences, :resume, foreign_key: true
  end
end
