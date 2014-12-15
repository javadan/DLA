class ChangedMeetingsAddedScheduledForState < ActiveRecord::Migration
  def self.up
    add_column :meetings, :scheduled_for, :date
    add_column :meetings, :state, :string
  end
  
  def self.down
    remove_column :meetings, :scheduled_for
    remove_column :meetings, :state
  end
end
