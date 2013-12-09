class CreateCheckExceptions < ActiveRecord::Migration
  def change
    create_table :check_exceptions do |t|
      t.integer :employee_id
      t.datetime :date
      t.integer :mode

      t.timestamps
    end
  end
end
