class RemoveSocialLinksTitleFromResumes < ActiveRecord::Migration[7.0]
  def change
    remove_column :resumes, :social_links_title, :string
  end
end
