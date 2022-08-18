# frozen_string_literal: true
class Ability
  include CanCan::Ability

  def initialize(user)
   if user.admin?
      can :manage, Book
      can :manage, BookIssue
   else
    cannot :manage, Book
    cannot :manage, BookIssue
   end
  end

end
