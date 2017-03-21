class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true  # Anyone can view a user
  end

  def create?
    true  # Anyone can create a user
  end

  def update?
    record == user  # Only user creator can update it
  end

  def destroy?
    record == user  # Only user creator can update it
  end
end
