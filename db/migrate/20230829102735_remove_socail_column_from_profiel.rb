class RemoveSocailColumnFromProfiel < ActiveRecord::Migration[7.0]
  def change
    remove_column :profiles, :projects, :string
    remove_column :profiles, :linkedin, :string
    remove_column :profiles, :facebook, :string
    remove_column :profiles, :github, :string
    remove_column :profiles, :website, :string
  end
end
