class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    
    can :read, User
    can :manage, Enrolment, user_id: user.id
    
    can :manage, Team if user.admin?
    can :manage, Feedback if user.admin?
    can :manage, Meeting if user.admin?
  end
end
