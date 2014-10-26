class CreateRequirements < ActiveRecord::Migration
  def self.up
    create_table :requirements do |t|
      t.string :type 
      t.string :deadline 
    end
    add_index :requirements, :type
  end
  
  def self.down
    drop_table :requirements
  end
end
