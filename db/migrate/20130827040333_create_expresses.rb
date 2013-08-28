class CreateExpresses < ActiveRecord::Migration
  def change
    create_table :expresses do |t|
      t.integer :employee_id
      t.string :company
      t.string :title
      t.date :from
      t.date :to
      t.string :reason

      t.timestamps
    end
  end
end
