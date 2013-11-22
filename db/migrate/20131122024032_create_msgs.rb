class CreateMsgs < ActiveRecord::Migration
  def change
    create_table :msgs do |t|
      t.integer :sender
      t.integer :receiver
      t.boolean :unread
      t.text :message

      t.timestamps
    end
  end
end
