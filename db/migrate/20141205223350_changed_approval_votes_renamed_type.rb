class ChangedApprovalVotesRenamedType < ActiveRecord::Migration
  def self.up
    rename_column :approval_votes, :type, :vote
  end
  
  def self.down
    rename_column :approval_votes, :vote, :type
  end
end
