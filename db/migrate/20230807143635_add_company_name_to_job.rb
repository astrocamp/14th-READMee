class AddCompanyNameToJob < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :company_name, :string
  end
end
