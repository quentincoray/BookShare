class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end


  def reviewed?
    record.user == user
  end

  def show?
    record.user == user
  end

  def update?
    record.user == user
  end
end
