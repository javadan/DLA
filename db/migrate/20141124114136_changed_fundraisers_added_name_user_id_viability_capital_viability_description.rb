class ChangedFundraisersAddedNameUserIdViabilityCapitalViabilityDescription < ActiveRecord::Migration
  def self.up
    add_column :fundraisers, :name, :string
    add_column :fundraisers, :user_id, :integer
    add_column :fundraisers, :viability_capital, :text
    add_column :fundraisers, :viability_description, :text
    add_index :fundraisers, :user_id
  end
  
  def self.down
    remove_column :fundraisers, :name
    remove_column :fundraisers, :user_id
    remove_column :fundraisers, :viability_capital
    remove_column :fundraisers, :viability_description
  end
end
