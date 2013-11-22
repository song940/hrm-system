class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :token
      t.string :username
      t.string :fullname
      t.string :password
      t.integer :status
      t.timestamps
    end
  end
end
