class FundraiserComment < ActiveRecord::Base
  belongs_to :fundraiser
  belongs_to :user

  structure do
    body :text
    timestamps
  end
end

