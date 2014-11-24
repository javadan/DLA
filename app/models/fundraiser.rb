class Fundraiser < ActiveRecord::Base

  belongs_to :user

  has_many :fundraiser_votes
  has_many :fundraiser_comments

  structure do
    name 'Ice rink partay'

    viability_description :text
    viability_capital :text
    viability_profit :text
    viability_risk :text
    viability_participation_event :text
    viability_participation_logistics :text

    timestamps
  end

  validates :name, presence: true
  validates :viability_description, presence: true


  has_many :fundraiser_votes
end
