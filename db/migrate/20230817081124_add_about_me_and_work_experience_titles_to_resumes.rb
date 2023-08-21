class AddAboutMeAndWorkExperienceTitlesToResumes < ActiveRecord::Migration[7.0]
  def change
    add_column :resumes, :about_me_title, :string
    add_column :resumes, :social_links_title, :string
  end
end
