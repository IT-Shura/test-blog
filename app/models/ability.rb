class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.has_role? :administrator
      can :manage, :all
    elsif user.has_role? :registered_user
      can [:edit, :update], [User], id: user.id
      can [:edit, :update, :destroy], [Comment], author: user
      can :create, [Comment]
      can :read, :all
    elsif user.has_role? :visitor
      can :create, [Comment]
      can :read, :all
    end
  end
end