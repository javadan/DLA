class Feedback < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }

  CATEGORIES = %w[fundraising debrief]

  structure do
    category :string
    body :text
    timestamps

    ab_best_moment :text
    ab_appraisal :text
    dla_negatives :text
    dla_your_contribution :text
    dla_what_enhanced_your_experience :text

    comments :text


  end

  validates :category, inclusion: CATEGORIES

end
