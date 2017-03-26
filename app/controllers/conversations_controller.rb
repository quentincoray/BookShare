class ConversationsController < ApplicationController

  def index
    @conversations = policy_scope(Conversation)
    if params[:conversation_id]
      @selected_conversation = @conversations.find[:conversation_id]
    else
      @selected_conversation = @conversations.first
    end
    if @selected_conversation
      @unread_messages = @selected_conversation.unread_messages(current_user)
      @unread_messages.each { |message| message.mark_as_read }
    else
      @messages = []
    end
    @unread_conversations_count = current_user.unread_conversations_count
  end

  def create
  end

  private

  def conversation_params
    params.require(:conversation).permit(:user2_id)
  end
end
