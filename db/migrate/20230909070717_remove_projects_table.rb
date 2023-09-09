class RemoveProjectsTable < ActiveRecord::Migration[7.0]
  def change
    execute 'DROP TABLE IF EXISTS projects CASCADE'
  end
end
