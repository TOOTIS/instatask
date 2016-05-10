class CreateBugs < ActiveRecord::Migration
  def change
    create_table :bugs do |t|
      t.string :application_token, null: false, default: "", index: true
      t.integer :number, null: false
      t.integer :status, null: false, default: 0
      t.integer :priority, null: false, default: 0

      t.timestamps null: false
    end
  end
end
