class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :employee_id
      t.integer :group_id
      t.integer :salary
      t.integer :status
      t.date :from
      t.date :to

      t.timestamps
    end
  end
end
