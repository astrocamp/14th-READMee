class RemoveSomeColumnFormUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :name
    remove_column :users, :real_name
    remove_column :users, :gender
    remove_column :users, :phone
    remove_column :users, :address
  end
end
