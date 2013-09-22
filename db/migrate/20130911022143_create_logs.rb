class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.integer :user_id
      t.integer :level
      t.string :tag
      t.text :msg

      t.timestamps
    end
  end
end
