class CreateShames < ActiveRecord::Migration
  def self.up
    create_table :shames do |t|
      t.integer :user_id 
      t.integer :group_id 
      t.datetime :updated_at 
      t.datetime :created_at 
    end
    add_index :shames, :user_id
    add_index :shames, :group_id
  end
  
  def self.down
    drop_table :shames
  end
end
