class AddAreasToResumes < ActiveRecord::Migration[7.0]
  def change
    add_column :resumes, :area_1, :integer
    add_column :resumes, :area_2, :integer
    add_column :resumes, :area_3, :integer
    add_column :resumes, :area_4, :integer
  end
end
