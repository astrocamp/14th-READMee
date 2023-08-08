class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :education
      t.string :languages
      t.string :skills
      t.text :summary
      t.text :work_experience
      t.string :certifications
      t.string :projects
      t.string :social_links
      t.string :avatar
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
