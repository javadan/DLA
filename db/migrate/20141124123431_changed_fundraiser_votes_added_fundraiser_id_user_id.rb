class ChangedFundraiserVotesAddedFundraiserIdUserId < ActiveRecord::Migration
  def self.up
    add_column :fundraiser_votes, :fundraiser_id, :integer
    add_column :fundraiser_votes, :user_id, :integer
    add_index :fundraiser_votes, :user_id
    add_index :fundraiser_votes, :fundraiser_id
  end
  
  def self.down
    remove_column :fundraiser_votes, :fundraiser_id
    remove_column :fundraiser_votes, :user_id
  end
end
