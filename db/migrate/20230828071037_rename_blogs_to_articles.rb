class RenameBlogsToArticles < ActiveRecord::Migration[7.0]
  def change
    rename_table :blogs, :articles
  end
end
