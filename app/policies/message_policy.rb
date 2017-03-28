class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope = Conversation.where(user1_id: user.id).or(Conversation.where(user2_id: user.id)).map { |conversation| conversation.messages }.flatten

    end
  end

  def create?
    return true
  end

  private

  def include_conversation?(user)
    @conversation = Conversation.find()
  end
end
