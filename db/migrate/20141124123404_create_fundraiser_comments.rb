class CreateFundraiserComments < ActiveRecord::Migration
  def self.up
    create_table :fundraiser_comments do |t|
      t.integer :fundraiser_id 
      t.integer :user_id 
      t.text :body 
      t.datetime :updated_at 
      t.datetime :created_at 
    end
    add_index :fundraiser_comments, :fundraiser_id
    add_index :fundraiser_comments, :user_id
  end
  
  def self.down
    drop_table :fundraiser_comments
  end
end
