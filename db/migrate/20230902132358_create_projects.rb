class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.jsonb :use_skill
      t.text :content
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
