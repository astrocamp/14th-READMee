class AddDeleteAtToPortfolios < ActiveRecord::Migration[7.0]
  def change
    add_column :portfolios, :deleted_at, :datetime
    add_index :portfolios, :deleted_at
  end
end
