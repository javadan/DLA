class Feedback < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }

  structure do
    ab_best_moment :text
    ab_appraisal :text
    dla_negatives :text
    dla_your_contribution :text
    dla_what_enhanced_your_experience :text

    comments :text

    timestamps
  end

  validates :ab_best_moment, :ab_appraisal, :dla_negatives, :dla_your_contribution, :dla_what_enhanced_your_experience, presence: true

end
