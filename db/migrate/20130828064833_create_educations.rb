class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.integer :employee_id
      t.integer :level
      t.string :institution
      t.string :discipline
      t.date :from
      t.date :to

      t.timestamps
    end
  end
end
