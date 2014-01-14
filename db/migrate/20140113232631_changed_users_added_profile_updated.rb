class ChangedUsersAddedProfileUpdated < ActiveRecord::Migration
  def self.up
    add_column :users, :profile_updated, :boolean, :default=>false
  end
  
  def self.down
    remove_column :users, :profile_updated
  end
end
