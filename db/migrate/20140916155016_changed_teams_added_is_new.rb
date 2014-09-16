class ChangedTeamsAddedIsNew < ActiveRecord::Migration
  def self.up
    add_column :teams, :is_new, :boolean, :default=>false
  end
  
  def self.down
    remove_column :teams, :is_new
  end
end
