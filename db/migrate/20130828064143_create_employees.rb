class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :passport
      t.string :telephone
      t.string :address
      t.integer :fingerkey
      
      t.timestamps
    end
  end
end
