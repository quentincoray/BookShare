class ConversationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user1_id: user.id).or(scope.where(user2_id: user.id))
    end

    def create?
      return true
    end
  end
end
