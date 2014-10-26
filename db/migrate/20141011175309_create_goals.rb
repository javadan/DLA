class CreateGoals < ActiveRecord::Migration
  def self.up
    create_table :goals do |t|
      t.string :type 
      t.datetime :deadline 
      t.datetime :updated_at 
      t.datetime :created_at 
    end
    add_index :goals, :type
  end
  
  def self.down
    drop_table :goals
  end
end
