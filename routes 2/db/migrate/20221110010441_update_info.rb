class UpdateInfo < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :name, :username
    remove_column :users, :email
    add_index :users, :username, unique: true
  end
end
