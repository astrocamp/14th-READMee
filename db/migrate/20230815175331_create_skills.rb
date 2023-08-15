class CreateSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :skills do |t|
      t.string :tag
      t.belongs_to :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
