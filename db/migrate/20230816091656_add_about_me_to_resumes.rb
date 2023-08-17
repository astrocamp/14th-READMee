class AddAboutMeToResumes < ActiveRecord::Migration[7.0]
  def change
    add_column :resumes, :about_me, :text
  end
end
