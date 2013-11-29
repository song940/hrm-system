class CreateAdminChecks < ActiveRecord::Migration
  def change
    create_table :admin_checks do |t|
      t.date :date
      t.integer :year
      t.integer :month

      t.timestamps
    end
  end
end
