class CreateCheckInfos < ActiveRecord::Migration
  def change
    create_table :check_infos do |t|
      t.decimal :tm
      t.decimal :en
      t.string :name
      t.decimal :gm
      t.decimal :mode
      t.datetime :chk

      t.timestamps
    end
  end
end
