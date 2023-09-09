class CreateSocialLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :social_links do |t|
      t.string :title
      t.string :link
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
