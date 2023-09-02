class RemoveAllColumnFromProfile < ActiveRecord::Migration[7.0]
  def change
    remove_column :profiles, :full_name
    remove_column :profiles, :phone
    remove_column :profiles, :address
    remove_column :profiles, :job_title
    remove_column :profiles, :education
    remove_column :profiles, :languages
    remove_column :profiles, :about_me
    remove_column :profiles, :work_experience
    remove_column :profiles, :work_exp_date
    remove_column :profiles, :education_date
  end
end
