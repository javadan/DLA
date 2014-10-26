class ChangedCompletionsAddedCreatedAtUpdatedAtUserId < ActiveRecord::Migration
  def self.up
    add_column :completions, :created_at, :datetime
    add_column :completions, :updated_at, :datetime
    add_column :completions, :user_id, :integer
    add_index :completions, :user_id
  end
  
  def self.down
    remove_column :completions, :created_at
    remove_column :completions, :updated_at
    remove_column :completions, :user_id
  end
end
