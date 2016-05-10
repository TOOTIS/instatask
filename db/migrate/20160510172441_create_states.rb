class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.belongs_to :bug, null: false
      t.string :device, null: false
      t.string :os, null: false
      t.integer :memory
      t.integer :storage

      t.timestamps null: false
    end
  end
end
