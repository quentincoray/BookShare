class ConversationsController < ApplicationController

  before_action :authenticate_user!
  after_action :verify_authorized, except: [:index]
  after_action :verify_policy_scoped, only: [:index]

  def index
    @conversations = policy_scope(Conversation).includes(:messages)
    @user = current_user

    @unread_messages = @conversations.map { |conversation| conversation.unread_messages(current_user)}.flatten
    @unread_messages.each { |message| message.mark_as_read }
  end

  def create
    authorize @conversation
    @conversation = Conversation.new(conversation_params)
    @conversation.user1 = current_user
    @conversation.save
    @message = Message.new(content: params[:message][:conversation_id])
    @message.user = current_user
    @message.save
    @messages = @conversation.messages.order(created_at: :desc)
    @conversations = current_user.conversations
  end

  private

  def conversation_params
    params.require(:conversation).permit(:user2_id)
  end
end
