class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :content
      t.string :address
      t.integer :num_of_people
      t.string :seniority
      t.integer :salary

      t.timestamps
    end
  end
end
