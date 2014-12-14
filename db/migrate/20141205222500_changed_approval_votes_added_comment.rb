class ChangedApprovalVotesAddedComment < ActiveRecord::Migration
  def self.up
    add_column :approval_votes, :comment, :text
  end
  
  def self.down
    remove_column :approval_votes, :comment
  end
end
