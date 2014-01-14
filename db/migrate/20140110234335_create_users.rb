class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :first_name 
      t.string :last_name 
      t.string :email 
      t.string :fb_uuid 
      t.string :fb_username 
      t.string :fb_token 
      t.datetime :fb_token_expires_at 
      t.datetime :updated_at 
      t.datetime :created_at 
    end
  end
  
  def self.down
    drop_table :users
  end
end
