class BookmatePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def newcoords?
    return true
  end

  def create?
    return true
  end
end
