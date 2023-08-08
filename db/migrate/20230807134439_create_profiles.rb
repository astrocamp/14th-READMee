class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.text :summary
      t.text :education
      t.text :work_experience
      t.text :skills
      t.text :languages
      t.text :certifications
      t.text :projects
      t.text :social_links
      t.string :avatar
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
