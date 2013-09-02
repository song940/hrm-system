class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.integer :employee_id
      t.string :name
      t.string :describe

      t.timestamps
    end
  end
end
