class ChangeSalaryAndNumOfPeopleToStrings < ActiveRecord::Migration[7.0]
  def change
    change_column :jobs, :salary, :string
    change_column :jobs, :num_of_people, :string
  end
end
