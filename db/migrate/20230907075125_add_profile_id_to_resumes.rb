class AddProfileIdToResumes < ActiveRecord::Migration[7.0]
  def change
    add_reference :resumes, :profile, foreign_key: true
  end
end
