class MessagesController < ApplicationController

  before_action :authenticate_user!
  after_action :verify_authorized

  def create
    @message = Message.new(message_params)
    authorize @message
    @all_messages = policy_scope(Message)
    @conversation = Conversation.find(params[:conversation_id])
    @message.user = current_user
    @message.conversation = @conversation
    if @message.save
      respond_to do |format|
        format.html { redirect_to user_conversations_path(@message.user) }
        format.js  # <-- link to `app/views/messages/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'form' }
        format.js  # <-- idem
      end
    end
    @messages = @conversation.messages.order(created_at: :desc)
    @conversations = current_user.conversations
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

end
