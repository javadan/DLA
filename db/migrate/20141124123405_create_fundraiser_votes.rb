class CreateFundraiserVotes < ActiveRecord::Migration
  def self.up
    create_table :fundraiser_votes do |t|
      t.string :type 
      t.datetime :updated_at 
      t.datetime :created_at 
    end
  end
  
  def self.down
    drop_table :fundraiser_votes
  end
end
