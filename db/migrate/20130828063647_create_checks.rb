class CreateChecks < ActiveRecord::Migration
  def change
    create_table :checks do |t|
      t.integer :employee_id
      t.integer :year
      t.integer :month
      t.datetime :chk
      t.timestamps
    end
  end
end
