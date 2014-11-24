class FundraiserVote < ActiveRecord::Base

  belongs_to :user
  belongs_to :fundraiser

  TYPES = %W(viable not_viable will_participate_event will_participate_logistics)
  structure do
    type 'viable'
    timestamps
  end
 
  validates :type, presence: true, inclusion: TYPES
end
