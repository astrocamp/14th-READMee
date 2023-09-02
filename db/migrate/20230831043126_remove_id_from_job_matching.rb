class RemoveIdFromJobMatching < ActiveRecord::Migration[7.0]
  def change
    change_table :job_matchings, id: false do |t|
      t.remove :id
    end
  end
end
