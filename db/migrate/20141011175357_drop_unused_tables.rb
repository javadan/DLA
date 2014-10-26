class DropUnusedTables < ActiveRecord::Migration
  def change
    drop_table :requirements
    drop_table :shames
    drop_table :completions
  end
end
