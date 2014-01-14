class ChangedUsersDeletedFbTokenExpiresAt < ActiveRecord::Migration
  def self.up
    remove_column :users, :fb_token_expires_at
  end
  
  def self.down
    add_column :users, :fb_token_expires_at, :datetime, :limit=>nil, :default=>nil
  end
end
