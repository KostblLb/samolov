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
      progress.in_progress? &&  progress.unit_progress.user == user || progress.review? && progress.teacher == user
    end
    can :update, QuizProgress do |quiz|
      quiz.is_quiz && quiz.quiz_progress_socket.quiz? || quiz.is_case && quiz.case_progress_socket.case?
    end
  end
end
