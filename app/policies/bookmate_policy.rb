class BookmatePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end

    def create?
      return true
    end

    def show?
      return true
    end
  end
end
