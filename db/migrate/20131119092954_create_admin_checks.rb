class CreateAdminChecks < ActiveRecord::Migration
  def change
    create_table :admin_checks do |t|
      t.date :date
      t.decimal :year
      t.decimal :month

      t.timestamps
    end
  end
end
