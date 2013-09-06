class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :group_id
      t.string :name
      t.integer :salary
      t.timestamps
    end
  end
end
