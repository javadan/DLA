class CreateMeetingAttendances < ActiveRecord::Migration
  def self.up
    create_table :meeting_attendances do |t|
      t.integer :meeting_id 
      t.integer :user_id 
      t.string :outcome 
      t.datetime :updated_at 
      t.datetime :created_at 
    end
    add_index :meeting_attendances, :meeting_id
    add_index :meeting_attendances, :user_id
  end
  
  def self.down
    drop_table :meeting_attendances
  end
end
