class ChatMessagesController < ApplicationController
    before_action :authenticate_user!

    def index
      if current_user.chat_messages.present?
        @chat = current_user.chat_messages.all
      end
    end

    def reply
      user_message = params[:message]
      @reply = ChatgptService.call(user_message)
      chat_message = ChatMessage.new(user_message: user_message, gpt_reply: @reply)
      chat_message.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.append("reply", partial: "chat")
        end
      end
    end
end
