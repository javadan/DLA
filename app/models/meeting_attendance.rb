class MeetingAttendance < ActiveRecord::Base

  belongs_to :meeting

  belongs_to :user

  OUTCOMES = %w{attended apologised}

  structure do
    outcome :string

    timestamps
  end

  validates :outcome, presence: true, inclusion: OUTCOMES

end
