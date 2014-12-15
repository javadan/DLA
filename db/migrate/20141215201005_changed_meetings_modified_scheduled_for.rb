class ChangedMeetingsModifiedScheduledFor < ActiveRecord::Migration
  def self.up
    change_column :meetings, :scheduled_for, :datetime
  end
  
  def self.down
    change_column :meetings, :scheduled_for, :date, :limit=>nil, :default=>nil
  end
end
