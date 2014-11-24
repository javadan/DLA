class CreateFundraisers < ActiveRecord::Migration
  def self.up
    create_table :fundraisers do |t|
      t.datetime :updated_at 
      t.datetime :created_at 
    end
  end
  
  def self.down
    drop_table :fundraisers
  end
end
