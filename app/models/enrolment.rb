class Enrolment < ActiveRecord::Base
  belongs_to :user
  belongs_to :team

  ROLES = %w(lead member volunteer)
  structure do
    role 'member', default: 'member', validates: { presence: true, inclusion: ROLES }
    approved false, default: false
    timestamps
  end
  validates :team_id, presence: true
  validates :user_id, presence: true
end
