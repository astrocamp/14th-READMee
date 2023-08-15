class CreateResumes < ActiveRecord::Migration[7.0]
  def change
    create_table :resumes do |t|
      t.integer :block
      t.string :avatar
      t.text :basic_info
      t.text :social_links
      t.text :summary
      t.text :work_experience
      t.string :skills
      # soft delete
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
