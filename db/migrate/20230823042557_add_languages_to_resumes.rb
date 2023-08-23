class AddLanguagesToResumes < ActiveRecord::Migration[7.0]
  def change
    add_column :resumes, :languages, :string
  end
end