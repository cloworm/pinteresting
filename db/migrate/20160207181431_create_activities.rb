class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :body, null: true
      t.integer :pin_id, null: false
      t.timestamps null: false
      t.integer :user_id, null: false
      t.string :type, null: false

      t.index :pin_id
      t.index :user_id
    end
  end
end
