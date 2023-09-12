class AddDateCloumnToProfile < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :work_exp_date, :string
    add_column :profiles, :education_date, :string
  end
end
