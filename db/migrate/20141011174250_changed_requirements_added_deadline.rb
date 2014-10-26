class ChangedRequirementsAddedDeadline < ActiveRecord::Migration
  def self.up
    add_column :requirements, :deadline, :datetime
  end
  
  def self.down
    remove_column :requirements, :deadline
  end
end
