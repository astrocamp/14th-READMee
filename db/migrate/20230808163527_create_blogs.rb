class CreateBlogs < ActiveRecord::Migration[7.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :content
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :blogs, :deleted_at
  end
end
