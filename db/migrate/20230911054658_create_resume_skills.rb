class CreateResumeSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :resume_skills do |t|
      t.references :resume, null: false, foreign_key: true
      t.references :skill, null: false, foreign_key: true

      t.timestamps
    end
  end
end
