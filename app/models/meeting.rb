class Meeting < ActiveRecord::Base

  has_many :users

  STATES = %w{tentative confirmed}  

  structure do
    scheduled_for Time.now
    state :string

    timestamps
  end

  validates :scheduled_for, presence: true
  validates :state, presence: true, inclusion: STATES

end
