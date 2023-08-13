class JobsRemoveColumnAddress < ActiveRecord::Migration[7.0]
  def change
    remove_column :jobs, :address
  end
end
