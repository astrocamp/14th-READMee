class ResetProfileColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :full_name, :string
    add_column :profiles, :phone, :string
    add_column :profiles, :address, :string
    add_column :profiles, :about_me, :text
    add_column :profiles, :languages, :jsonb
    add_column :profiles, :job_hunting, :jsonb
    add_column :profiles, :social_link, :jsonb
  end
end
