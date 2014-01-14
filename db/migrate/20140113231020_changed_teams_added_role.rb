class ChangedTeamsAddedRole < ActiveRecord::Migration
  def self.up
    add_column :teams, :role, :text
  end
  
  def self.down
    remove_column :teams, :role
  end
end
