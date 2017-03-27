class MessagesController < ApplicationController

  before_action :authenticate_user!
  after_action :verify_authorized

  def create
    authorize @message
    @conversation = Conversation.find(params[:conversation_id])
    @message = Message.new(message_params)
    @message.user = current_user
    @message.conversation = @conversation
    @message.save
    @messages = @conversation.messages.order(created_at: :desc)
    @conversations = current_user.conversations
  end

  private

  def message_params
    params.require(:message).permet(:content)
  end

end
