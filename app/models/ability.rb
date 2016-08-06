class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role == "admin"
      can :manage, :all
    else
      can :read, :all
      can :create, Lesson
      can :update, Lesson do |lesson|
        lesson.user == user
      end
      can :update, User do |current_user|
        current_user == user
      end
    end
  end
end
