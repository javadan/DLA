class ChangedUsersAddedNewsletterSubscribed < ActiveRecord::Migration
  def self.up
    add_column :users, :newsletter_subscribed, :boolean, :default=>false
  end
  
  def self.down
    remove_column :users, :newsletter_subscribed
  end
end
