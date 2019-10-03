class ConversationsController < ApplicationController
  helper_method :get_mailbox, :get_conversation

    def index
        @conversations = current_user.mailbox.conversations
    end

    def show
        @conversation = current_user.mailbox.conversations.find(params[:id])
    end

    def new
        @recipients = User.all - [current_user]
    end

    def create
        recipient = User.find(params[:user_id])
        receipt = current_user.send_message(recipient, params[:body], params[:subject])
        redirect_to conversation_path(receipt.conversation)
    end



    def get_conversation
        @conversation ||= @mailbox.conversations.find(params[:id])
    end

    def get_mailbox
        @mailbox ||= current_user.mailbox
      end

end