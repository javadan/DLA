class CreateApprovalVotes < ActiveRecord::Migration
  def self.up
    create_table :approval_votes do |t|
      t.integer :candidate_id 
      t.integer :user_id 
      t.string :type 
      t.datetime :updated_at 
      t.datetime :created_at 
    end
    add_index :approval_votes, :candidate_id
    add_index :approval_votes, :user_id
  end
  
  def self.down
    drop_table :approval_votes
  end
end
