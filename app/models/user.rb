class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :feedbacks

  has_many :fundraisers
  has_many :fundraiser_votes

  has_many :fundraiser_comments
  
  structure do
    first_name 'Dan'
    last_name 'Davey'
    email 'overlords@dirtyloveaffairs.com'

    fb_uid '100007074455662'
    fb_username 'dan.davey.146'
    fb_token 'CAAICWubbWsQBAHsj3t'

    admin false, default: false
    shamed false, default: false
    email_confirmed_at DateTime.now
    email_confirmation_token SecureRandom.uuid, index: true

    profile_updated false, default: false
    newsletter_subscribed false, default: false

    timestamps 
  end

  validates :first_name, :last_name,
            presence: true
  validates :fb_uid, :fb_token,
            presence: true,
            uniqueness: true

  has_many :enrolments, dependent: :destroy
  has_many :teams, through: :enrolments
  has_many :shames
  # has_many :shamed_teams, through: :shames

  def name
    [first_name, last_name].compact.join ' '
  end

  def self.authenticate(auth_hash)
    User.where(:fb_uid => auth_hash['uid']).first_or_initialize({
      :first_name => auth_hash.fetch('info',{})['first_name'],
      :last_name => auth_hash.fetch('info',{})['last_name'],
      :email => auth_hash.fetch('info',{})['email'],
      :fb_username => auth_hash.fetch('extra',{}).fetch('raw_info',{})['username'],
      :fb_token => auth_hash.fetch('credentials',{})['token']
    }).tap do |user|
      if user.new_record?
        user.save!
        NewsletterService.new.subscribe_user(user)
      end
    end
  end

  def email_confirmed?
    email_confirmed_at.present?
  end

  def generate_email_confirmation_token
    self.email_confirmation_token = SecureRandom.uuid
  end

end
