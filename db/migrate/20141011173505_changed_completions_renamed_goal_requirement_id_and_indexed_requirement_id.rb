class ChangedCompletionsRenamedGoalRequirementIdAndIndexedRequirementId < ActiveRecord::Migration
  def self.up
    rename_column :completions, :goal_requirement_id, :requirement_id
  end
  
  def self.down
    rename_column :completions, :requirement_id, :goal_requirement_id
  end
end
