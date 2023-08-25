class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :articles, :deleted_at
  end
end