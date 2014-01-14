class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    
    can :read, User
    can :manage, Enrolment, user_id: user.id
    
    can :manage, Team if user.admin?
  end
end
