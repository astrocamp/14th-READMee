class RemoveReferenceToEducations < ActiveRecord::Migration[7.0]
  def change
    remove_reference :educations, :resume, foreign_key: true
  end
end
