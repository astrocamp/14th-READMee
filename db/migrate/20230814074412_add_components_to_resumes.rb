class AddComponentsToResumes < ActiveRecord::Migration[7.0]
  def change
    add_column :resumes, :component_name, :string 
    add_index :resumes, :component_name, unique: true
  end
end
