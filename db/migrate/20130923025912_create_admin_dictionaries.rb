class CreateAdminDictionaries < ActiveRecord::Migration
  def change
    create_table :admin_dictionaries do |t|
      t.string :name
      t.string :key
      t.string :value

      t.timestamps
    end
  end
end
