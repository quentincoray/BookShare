class Conversation < ApplicationRecord
  belongs_to :user1, class_name: "User"
  belongs_to :user2, class_name: "User"
  has_many :messages, dependent: :destroy

  validates :user1, uniqueness: {scope: :user2}
  validates :user2, :user1, presence: true

  def users
    return [user1, user2]
  end

  def other_user(user)
    users - [User.find_by_id(user.id)]
    # raise
  end

  def unread_messages(user)
    scope = Conversation.where(user1_id: user.id).or(Conversation.where(user2_id: user.id)).map { |conversation| conversation.messages }.flatten
    # policy_scope(Message)
  end

  def unread_messages_count(user)
    unread_messages(user).count
  end

  def unread_messages?(user)
    unread_messages_count(user) > 0
  end

  def last_message
    messages.order(created_at: :asc).last
  end
end
