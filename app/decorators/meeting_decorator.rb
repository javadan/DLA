class MeetingDecorator < Draper::Decorator
  delegate_all

  decorates_association :user
  decorates_association :meeting_attendances

end
