class ChangedUsersRenamedFbUuid < ActiveRecord::Migration
  def self.up
    rename_column :users, :fb_uuid, :fb_uid
  end
  
  def self.down
    rename_column :users, :fb_uid, :fb_uuid
  end
end
