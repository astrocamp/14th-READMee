class AddProfileToResumes < ActiveRecord::Migration[7.0]
  def change
    add_reference :resumes, :profile, null: false, foreign_key: true
  end
end
