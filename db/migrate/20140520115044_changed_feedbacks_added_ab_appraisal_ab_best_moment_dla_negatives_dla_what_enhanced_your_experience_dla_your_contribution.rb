class ChangedFeedbacksAddedAbAppraisalAbBestMomentDlaNegativesDlaWhatEnhancedYourExperienceDlaYourContribution < ActiveRecord::Migration
  def self.up
    add_column :feedbacks, :ab_appraisal, :text
    add_column :feedbacks, :ab_best_moment, :text
    add_column :feedbacks, :dla_negatives, :text
    add_column :feedbacks, :dla_what_enhanced_your_experience, :text
    add_column :feedbacks, :dla_your_contribution, :text
  end
  
  def self.down
    remove_column :feedbacks, :ab_appraisal
    remove_column :feedbacks, :ab_best_moment
    remove_column :feedbacks, :dla_negatives
    remove_column :feedbacks, :dla_what_enhanced_your_experience
    remove_column :feedbacks, :dla_your_contribution
  end
end
