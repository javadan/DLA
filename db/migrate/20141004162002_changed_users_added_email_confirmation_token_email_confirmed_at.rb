class ChangedUsersAddedEmailConfirmationTokenEmailConfirmedAt < ActiveRecord::Migration
  def self.up
    add_column :users, :email_confirmation_token, :string
    add_column :users, :email_confirmed_at, :string
    add_index :users, :email_confirmation_token
  end
  
  def self.down
    remove_column :users, :email_confirmation_token
    remove_column :users, :email_confirmed_at
  end
end
