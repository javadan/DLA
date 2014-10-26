class CreateGoalUsers < ActiveRecord::Migration
  def self.up
    create_table :goal_users do |t|
      t.integer :goal_id 
      t.integer :user_id 
      t.string :completed_at 
      t.datetime :updated_at 
      t.datetime :created_at 
    end
    add_index :goal_users, :goal_id
    add_index :goal_users, :user_id
  end
  
  def self.down
    drop_table :goal_users
  end
end
