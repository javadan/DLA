class ChangedRequirementsDeletedDeadline < ActiveRecord::Migration
  def self.up
    remove_column :requirements, :deadline
  end
  
  def self.down
    add_column :requirements, :deadline, :string, :limit=>nil, :default=>nil
  end
end
