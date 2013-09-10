class CreateNotifictions < ActiveRecord::Migration
  def change
    create_table :notifictions do |t|
      t.references :user, index: true
      t.integer :sender
      t.text :msg
      t.boolean :unread
      
      t.timestamps
    end
  end
end
