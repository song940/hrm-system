class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :gender
      t.string :passport

      t.timestamps
    end
  end
end
