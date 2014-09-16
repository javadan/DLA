class Team < ActiveRecord::Base
  default_scope ->{ order(:created_at) }
  structure do
    name 'Overlords', validates: { presence: true, uniqueness: true }
    role :text
    is_new false, default: false
    timestamps
  end
  has_many :enrolments, dependent: :destroy
  has_many :users, through: :enrolments
  has_many :shames
  # has_many :shamed_users, through: :shames, source: :user 
end
