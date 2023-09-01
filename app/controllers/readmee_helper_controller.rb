class ReadmeeHelperController < ApplicationController
    def index
      @chat = current_user.chat_messages.all
    end
    
    # def call_chatgpt
    #    @response = ChatgptService.call(params[:message])
    # end
    def reply
        user_message = params[:message]
        @reply = ChatgptService.call(user_message)
      
        respond_to do |format|
          format.turbo_stream do
            render turbo_stream: turbo_stream.append("reply", partial: "chat")
          end
        end
      end
      
end
