class AddProfileFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :lab, :string, null: true
    add_column :users, :skill_2d, :string, null: true
    add_column :users, :skill_3d, :string, null: true
  end
end
