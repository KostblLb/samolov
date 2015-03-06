class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read_adverts, Group do |group|
      group.teacher == user || group.students.include?(user)
    end
    can :manage_adverts, Group do |group|
      group.teacher == user
    end
    can :manage, Group do |group|
      group.teacher == user
    end
    can :update, Homework::Progress  do |progress|
       progress.state == :in_progress &&  progress.student == user || progress.state == :review && progress.teacher == user
    end
  end
end
