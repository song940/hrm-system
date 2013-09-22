class CreateChecks < ActiveRecord::Migration
  def change
    create_table :checks do |t|
      t.integer :employee_id
      t.timestamps
    end
  end
end
