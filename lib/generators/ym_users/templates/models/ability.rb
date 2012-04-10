class Ability
  include CanCan::Ability
  def initialize(user)
    if user.try(:admin?)
      can :manage, :all      
    elsif user
      can :manage, User, :id => user.id
    else
      cannot [:create, :update, :destroy], :all
    end
  end
end
