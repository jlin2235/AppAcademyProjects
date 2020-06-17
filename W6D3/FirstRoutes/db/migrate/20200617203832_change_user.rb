class ChangeUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :email, :string
    rename_column :users, :name, :username
    
  end
  add_index :users, :name, unique: true
end
