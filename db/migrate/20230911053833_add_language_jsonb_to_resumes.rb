class AddLanguageJsonbToResumes < ActiveRecord::Migration[7.0]
  def change
    add_column :resumes, :languages, :jsonb
  end
end
