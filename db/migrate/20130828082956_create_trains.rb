class CreateTrains < ActiveRecord::Migration
  def change
    create_table :trains do |t|
      t.string :name
      t.integer :employee_id
      t.string :keynote
      t.datetime :date
      t.integer :duration
      t.string :address
      t.boolean :must

      t.timestamps
    end
  end
end
