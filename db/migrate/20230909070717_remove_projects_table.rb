class RemoveProjectsTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :projects, force: :cascade
  end
end
