class ChangedUsersAddedShamed < ActiveRecord::Migration
  def self.up
    add_column :users, :shamed, :boolean, :default=>false
  end
  
  def self.down
    remove_column :users, :shamed
  end
end
