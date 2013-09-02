class CreateChecks < ActiveRecord::Migration
  def change
    create_table :checks do |t|
      t.integer :employee_id
      t.date :check_in
      t.date :check_out

      t.timestamps
    end
  end
end
