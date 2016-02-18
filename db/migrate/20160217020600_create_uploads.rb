class CreateUploads < ActiveRecord::Migration
  def up
    create_table :uploads do |t|
      t.timestamps
      t.integer :user_id, null: false
      t.integer :pin_id, null: false

      # No indexes because we won't often be looking up users or pins from an upload.
      # t.index :user_id
      # t.index :pin_id
    end
    add_attachment :uploads, :attachment
  end

  def down
    remove_attachment :uploads, :attachment
    drop_table :uploads
  end
end
