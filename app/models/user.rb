class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :feedbacks
  
  structure do
    first_name 'Dan'
    last_name 'Davey'
    email 'overlords@dirtyloveaffairs.com'

    fb_uid '100007074455662'
    fb_username 'dan.davey.146'
    fb_token 'CAAICWubbWsQBAHsj3t'

    admin false, default: false
    shamed false, default: false

    profile_updated false, default: false

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
    User.where(:fb_uid => auth_hash['uid']).first_or_create({
      :first_name => auth_hash.fetch('info',{})['first_name'],
      :last_name => auth_hash.fetch('info',{})['last_name'],
      :email => auth_hash.fetch('info',{})['email'],
      :fb_username => auth_hash.fetch('extra',{}).fetch('raw_info',{})['username'],
      :fb_token => auth_hash.fetch('credentials',{})['token']
    }).tap do |user|
      return nil unless user.persisted?
    end
  end

end
