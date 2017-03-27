class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end

    def create?
      return true
    end
  end
end
