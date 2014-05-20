class CreateFeedbacks < ActiveRecord::Migration
  def self.up
    create_table :feedbacks do |t|
      t.integer :user_id 
      t.text :what_worked_well 
      t.text :what_needs_improvement 
      t.text :comments 
      t.datetime :updated_at 
      t.datetime :created_at 
    end
    add_index :feedbacks, :user_id
  end
  
  def self.down
    drop_table :feedbacks
  end
end
