class ChangedFeedbacksDeletedWhatWorkedWellWhatNeedsImprovement < ActiveRecord::Migration
  def self.up
    remove_column :feedbacks, :what_worked_well
    remove_column :feedbacks, :what_needs_improvement
  end
  
  def self.down
    add_column :feedbacks, :what_worked_well, :text, :limit=>nil, :default=>nil
    add_column :feedbacks, :what_needs_improvement, :text, :limit=>nil, :default=>nil
  end
end
