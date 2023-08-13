class AddCompanyIdToJob < ActiveRecord::Migration[7.0]
  def change
    add_belongs_to :jobs, :company, index: true
  end
end
