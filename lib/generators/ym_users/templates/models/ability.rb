# Don't delete comments! They are used in gems for adding abilities
class Ability
  
  include CanCan::Ability
  
  def initialize(user)
    if user.try(:admin?)
      # admin ability
      can :manage, :all      
    elsif user
      # user ability
      can :manage, User, :id => user.id
    else
      # open ability
      cannot [:create, :update, :destroy], :all
    end
  end
  
end
