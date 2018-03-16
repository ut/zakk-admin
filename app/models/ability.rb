class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
    elsif user.has_role?("user")
      can :manage, Event
      can :manage, Location
      can :manage, Program
      can :manage, Content
      can :manage, Flyer
    else
      can :read, :all
    end

    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities

  end
end
