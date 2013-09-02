class CreatePerformances < ActiveRecord::Migration
  def change
    create_table :performances do |t|
      t.integer :employee_id
      t.integer :number
      t.string :reason

      t.timestamps
    end
  end
end
