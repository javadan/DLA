class CreateEnrolments < ActiveRecord::Migration
  def self.up
    create_table :enrolments do |t|
      t.integer :user_id 
      t.integer :team_id 
      t.string :role, :default=>"member" 
      t.boolean :approved, :default=>false 
      t.datetime :updated_at 
      t.datetime :created_at 
    end
    add_index :enrolments, :user_id
    add_index :enrolments, :team_id
  end
  
  def self.down
    drop_table :enrolments
  end
end
