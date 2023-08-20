class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :avatar
      t.string :full_name
      t.string :phone
      t.string :address
      t.string :job_title
      t.string :education
      t.jsonb :languages, default: {}
      t.text :about_me
      t.text :work_experience
      t.string :projects
      t.string :linkedin
      t.string :facebook
      t.string :github
      t.string :website
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
