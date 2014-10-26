class CreateCompletions < ActiveRecord::Migration
  def self.up
    create_table :completions do |t|
      t.integer :goal_requirement_id 
    end
    add_index :completions, :goal_requirement_id
  end
  
  def self.down
    drop_table :completions
  end
end
