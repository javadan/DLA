class ApprovalVote < ActiveRecord::Base

  belongs_to :candidate, class_name: 'User'
  belongs_to :user

  VOTES = %W(vouch approve veto)

  structure do
    vote 'viable'
    comment :text
    timestamps
  end
 
  validates :vote, presence: true, inclusion: VOTES
  validates :comment, presence: true
end
